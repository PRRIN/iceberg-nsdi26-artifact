#!/bin/bash

zone="Zones"
test_suite="$1"

mkdir "${zone}"/json -p

for file in "${zone}"/"${test_suite}"/0.txt; do
    filename=$(basename "$file" .txt)

    domain=$(head -n 1 "$file" | awk '{print $1}')

    conf="
// named.conf
options {
    directory \"/var/cache/bind\";
    listen-on { any; };
    allow-query { any; };
    allow-recursion { any; };
    dnssec-validation no;
    qname-minimization off;
    stale-cache-enable no;
    stale-answer-enable no;
    minimal-responses no;
    empty-zones-enable no;
    version none;
    hostname none;
    server-id none;
    root-key-sentinel false;
    rrset-order { order none; };
    check-names master warn;
};

zone \"${domain}\" IN {
    type master;
    file \"/etc/bind/zone\";
    dnssec-policy default;
    inline-signing yes;
};

zone \".\" IN {
        type master;
        file \"/etc/bind/fake.root\";
        // allow-query { none; };
};

logging {
        channel named           { file \"named.log\"     versions 10 size 20M; severity info;   print-time iso8601-utc; print-category yes; print-severity yes; };
        channel security        { file \"security.log\"  versions 10 size 20M; severity info;   print-time iso8601-utc; print-severity yes; };
        channel ratelimit       { file \"ratelimit.log\" versions 10 size 20M; severity info;   print-time iso8601-utc; print-severity yes; };
        channel query_log       { file \"query.log\"     versions 10 size 20M; severity debug;  print-time iso8601-utc; print-severity yes; };
        channel xfer            { file \"transfer.log\"  versions 10 size 10M; severity info;   print-time iso8601-utc; print-severity yes; };
        channel update          { file \"update.log\"    versions 10 size 10M; severity info;   print-time iso8601-utc; print-severity yes; };

        category default        { default_syslog;  named; };
        category general        { default_syslog;  named; };
        category security       { security; };
        category queries        { query_log; };
        category config         { default_syslog; named; };
        category network        { default_syslog; named; };
        category rate-limit     { ratelimit; };
        category xfer-in        { default_syslog; xfer; };
        category xfer-out       { default_syslog; xfer; };
        category notify         { default_syslog; xfer; };
};
"
    
    fakeroot="
\$TTL    300
.               IN      SOA ns. hostmaster.xy.com. (
                        20120101 1800 900 604800 86400
                )
.               IN      NS      ns
ns              IN      A       127.0.0.1
"

    rm /etc/bind/*
    rm /var/cache/bind/dump.txt
    echo "${conf}" > /etc/bind/named.conf
    cp "$file" /etc/bind/zone
    echo "${fakeroot}" > /etc/bind/fake.root

    # Wait until bind is running
    ./bin/named/named -g -c /etc/bind/named.conf > /dev/null 2>&1 & 
    sleep 2

    # Dig
    dig @127.0.0.1 "${domain}" SOA > /dev/null &
    sleep 1
    pkill named

    # Normalize
    truncate /var/cache/bind/dump.txt --size -2
    sed -i '1s/^/{\n/' /var/cache/bind/dump.txt
    sed -i '$s/$/\n}/' /var/cache/bind/dump.txt
    python3 normalize.py /var/cache/bind/dump.txt > info.txt

    mkdir -p "${zone}/json/${filename}"
    mv ctx-norm.json "${zone}/json/${filename}/"
    mv info.txt "${zone}/json/${filename}/"
    
    echo "${file} complete"

    # Make sure it's dead
    while pgrep -x "named" > /dev/null
    do
        sleep 0.1
    done
done
