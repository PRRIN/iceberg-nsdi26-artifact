from dns import *
import random
import sys

def gen_domain_name(len: int, no_wild=False) -> DomainName:
    labels = []
    for i in range(len):
        roll = random.randint(1, 10 + (0 if no_wild and i == 0 else 2))
        if roll <= 10:
            labels.append(chr(ord('a') + roll - 1))
        else:
            labels.append("*")

    return DomainName(labels)

def gen_soa_rr(origin: DomainName) -> SOA:
    return SOA(
        origin,
        "mname.com.",
        "rname.com.",
        3,
        604800,
        86400,
        2419200,
        604800
    )

def gen_a_rr(origin: DomainName, exact=False) -> A:
    name_len = random.randint(0, len(origin))
    name = gen_domain_name(name_len, no_wild=True) + origin if not exact else origin
    return A(name, f"{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(0, 255)}.{random.randint(0, 255)}")

def gen_aaaa_rr(origin: DomainName) -> AAAA:
    name_len = random.randint(0, len(origin))
    return AAAA(
        gen_domain_name(name_len, no_wild=True) + origin, 
        f"{random.randint(1, 9)}:{random.randint(1, 9)}:{random.randint(1, 9)}:{random.randint(1, 9)}:{random.randint(1, 9)}:{random.randint(1, 9)}:{random.randint(1, 9)}:{random.randint(1, 9)}"
    )

def gen_cname_rr(origin: DomainName) -> CNAME:
    name_len = random.randint(0, len(origin))
    name = gen_domain_name(name_len) + origin
    target_len = random.randint(0, len(origin))
    return CNAME(name, gen_domain_name(target_len) + origin)
        
    
def gen_dname_rr(origin: DomainName) -> DNAME:
    name_len = random.randint(0, len(origin))
    name = gen_domain_name(name_len, no_wild=True) + origin
    target_len = random.randint(0, len(origin))
    return DNAME(name, gen_domain_name(target_len) + origin)
        
    
def gen_ns_rr(origin: DomainName, exact=False) -> NS:
    free = random.randint(1, 4) == 1
    name_len = random.randint(0, len(origin))
    name = gen_domain_name(name_len, no_wild=True) + origin if not exact else origin
    if free:
        ns_len = random.randint(0, 2 * len(origin))
        return NS(name, gen_domain_name(ns_len, no_wild=True))
    else:
        ns_len = random.randint(0, len(origin))
        return NS(name, gen_domain_name(ns_len, no_wild=True) + origin)

def gen_mx_rr(origin: DomainName) -> MX:
    free = random.randint(1, 4) == 1
    name_len = random.randint(0, len(origin))
    name = gen_domain_name(name_len) + origin
    if free:
        mx_len = random.randint(0, 2 * len(origin))
        return MX(name, gen_domain_name(mx_len, no_wild=True))
    else:
        mx_len = random.randint(0, len(origin))
        return MX(name, gen_domain_name(mx_len, no_wild=True) + origin)

def gen_srv_rr(origin: DomainName) -> SRV:
    free = random.randint(1, 4) == 1
    name_len = random.randint(0, len(origin))
    name = gen_domain_name(name_len) + origin
    if free:
        srv_len = random.randint(0, 2 * len(origin))
        return SRV(name, gen_domain_name(srv_len, no_wild=True), 7890, 10, 50)
    else:
        srv_len = random.randint(0, len(origin))
        return SRV(name, gen_domain_name(srv_len, no_wild=True) + origin, 7890, 10, 50)

def gen_txt_rr(origin: DomainName) -> TXT:
    name_len = random.randint(0, len(origin))
    return TXT(gen_domain_name(name_len) + origin, "iceberg")

# From Groot - Apendix A
def checkzone(zone: Zone) -> bool:
    # One apex SOA at origin

    # NS should be either at the apex or a cut
    nsrrs = list(filter(lambda rr: isinstance(rr, NS) and rr.name != zone.origin, zone.rrs))
    for i in range(len(nsrrs)):
        for j in range(i):
            if nsrrs[i].name.is_suffix_of(nsrrs[j].name):
                return False
    
    # CNAME should be unique at its owner name
    for cname in zone.rrs:
        if isinstance(cname, CNAME):
            # print([rr.name == cname.name for rr in zone.rrs])
            if any(rr.name == cname.name for rr in zone.rrs if rr != cname):
                return False
    
    # DNAME should be at leaf; at most one DNAME should exist at its owner name;
    # and it should not co-exist with a NS, unless it's origin
    for dname in zone.rrs:
        if isinstance(dname, DNAME):
            if any(rr.name == dname.name for rr in zone.rrs if rr != dname and isinstance(rr, DNAME)):
                return False
            if dname.name != zone.origin and any(rr.name == dname.name for rr in zone.rrs if isinstance(rr, NS)):
                return False
            if any(dname.name.is_suffix_of(rr.name) for rr in zone.rrs if len(rr.name) > len(dname.name)):
                return False
    
    # No wildcard DNAME/NS?
    return True
    

def gen_zone(size: int) -> Zone:
    assert size >= 1, "No empty zone"
    orig_len = random.randint(1, 2)
    # CoreDNS currently has a bug where if the zone origin is provided as uppercased,
    # then the zone will not be available. 
    # Thus here we make sure the origin domain name is lowercased.
    origin = gen_domain_name(orig_len, no_wild=True)
    origin.labels = [label.lower() for label in origin.labels]

    done = False
    while not done:
        rrs = [gen_soa_rr(origin), gen_ns_rr(origin, exact=True)]
        rr_text = {str(rr) for rr in rrs}
        while len(rrs) < size:
            roll = random.randint(1, 100)
            if roll <= 20:
                rr = gen_a_rr(origin)
            elif roll <= 40:
                rr = gen_aaaa_rr(origin)
            elif roll <= 50:
                rr = gen_cname_rr(origin)
            elif roll <= 60:
                rr = gen_dname_rr(origin)
            elif roll <= 70:
                rr = gen_ns_rr(origin)
            elif roll <= 80:
                rr = gen_mx_rr(origin)
            elif roll <= 90:
                rr = gen_srv_rr(origin)
            else:
                rr = gen_txt_rr(origin)
            rr_str = str(rr)
            if rr_str not in rr_text:
                rr_text.add(rr_str)
                rrs.append(rr)

        for ns in rrs:
            if isinstance(ns, NS) \
                and ns.name == origin \
                and origin.is_suffix_of(ns.ns) :
                if not any(isinstance(rr, (A, AAAA)) and rr.name == ns.ns for rr in rrs):
                    rrs.append(gen_a_rr(ns.ns, exact=True))
        zone = Zone(origin, rrs)
        done = checkzone(zone)
    
    return zone


if __name__ == "__main__":
    path = "/Users/echostone/Documents/DNS/pdns-mod/pdns-rel-auth-4.8.x/Zones/NewComplex"
    for id in range(1000):
        random.seed(id)
        zone = gen_zone(10)
        with open(f"{path}/{id}.txt", "w") as f:
            f.write(str(zone))
            f.write("\n")
    