#!/bin/bash

zone="Zones"
test_suite="$1"

mkdir "${zone}"/json -p

for file in "${zone}"/"${test_suite}"/0.txt; do
    filename=$(basename "$file" .txt)

    domain=$(head -n 1 "$file" | awk '{print $1}')

    pdnsconf="
launch=bind
distributor-threads=1
dname-processing=yes
8bit-dns=yes
bind-config=/usr/local/etc/named.conf
"

    namedconf="
// named.conf
options {
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
    file \"/usr/local/etc/zone\";
};
"

    rm /usr/local/etc/*
    rm /app/dump.json
    echo "${namedconf}" > /usr/local/etc/named.conf
    echo "${pdnsconf}" > /usr/local/etc/pdns.conf
    cp "$file" /usr/local/etc/zone

    # Wait until pdns is running
    ./pdns/pdns_server > /dev/null 2>&1 & 
    sleep 2

    # Dig
    dig @127.0.0.1 "${domain}" SOA > /dev/null &
    sleep 1
    pkill pdns_server

    # Normalize
    truncate dump.json --size -2
    sed -i '1s/^/{\n/' dump.json
    sed -i '$s/$/\n}/' dump.json
    python3 normalize.py dump.json > info.txt

    mkdir -p "${zone}/json/${filename}"
    mv ctx-norm.json "${zone}/json/${filename}/ctx.json"
    mv info.txt "${zone}/json/${filename}/"
    
    echo "${file} complete"

    # Make sure it's dead
    while pgrep -x "pdns_server" > /dev/null
    do
        sleep 0.1
    done
done
