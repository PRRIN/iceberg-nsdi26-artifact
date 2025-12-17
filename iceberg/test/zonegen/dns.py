from typing import List, Self

'''
A fully qualified domain name.
'''
class DomainName:
    def __init__(self, labels: List[str]):
        for label in labels:
            assert label, "Label cannot be empty"
        self.labels = labels
    
    def __str__(self) -> str:
        return ".".join(self.labels) + "."
    
    def __len__(self) -> int:
        return len(self.labels)
    
    def __add__(self, y: Self) -> Self:
        return DomainName(self.labels + y.labels)
    
    def is_suffix_of(self, y: Self) -> bool:
        return len(self.labels) <= len(y.labels) \
            and y.labels[-len(self.labels):] == self.labels
    
    def __eq__(self, y: Self) -> bool:
        return self.labels == y.labels
        

'''
A DNS Resource Record
'''
class RR:
    def __init__(self, name: DomainName):
        self.name = name
        self.rclass = "IN"
        self.ttl = 500

    def __str__(self):
        return f"{self.name}\t\t{self.ttl} {self.rclass} "

class SOA(RR):
    def __init__(self, name: DomainName, mname, rname, serial, refresh, retry, expire, minimum):
        super().__init__(name)
        self.mname = mname
        self.rname = rname
        self.serial = serial
        self.refresh = refresh
        self.retry = retry
        self.expire = expire
        self.minimum = minimum

    def __str__(self):
        return super().__str__() + f"SOA\t{self.mname} {self.rname} {self.serial} {self.refresh} {self.retry} {self.expire} {self.minimum}"

class NS(RR):
    def __init__(self, name: DomainName, ns: DomainName):
        super().__init__(name)
        self.ns = ns

    def __str__(self):
        return super().__str__() + f"NS\t{self.ns}"

class A(RR):
    def __init__(self, name: DomainName, ip):
        super().__init__(name)
        self.ip = ip

    def __str__(self):
        return super().__str__() + f"A\t{self.ip}"

class AAAA(RR):
    def __init__(self, name: DomainName, ip):
        super().__init__(name)
        self.ip = ip

    def __str__(self):
        return super().__str__() + f"AAAA\t{self.ip}"

class CNAME(RR):
    def __init__(self, name: DomainName, target: DomainName):
        super().__init__(name)
        self.target = target

    def __str__(self):
        return super().__str__() + f"CNAME\t{self.target}"

class DNAME(RR):
    def __init__(self, name: DomainName, target: DomainName):
        super().__init__(name)
        self.target = target

    def __str__(self):
        return super().__str__() + f"DNAME\t{self.target}"

class MX(RR):
    def __init__(self, name: DomainName, exchange: DomainName):
        super().__init__(name)
        self.preference = 10
        self.exchange = exchange

    def __str__(self):
        return super().__str__() + f"MX\t{self.preference} {self.exchange}"
    
class SRV(RR):
    def __init__(self, name: DomainName, target: DomainName, port, priority, weight):
        super().__init__(name)
        self.target = target
        self.port = port
        self.priority = priority
        self.weight = weight

    def __str__(self):
        return super().__str__() + f"SRV\t{self.priority} {self.weight} {self.port} {self.target}"

class TXT(RR):
    def __init__(self, name: DomainName, text):
        super().__init__(name)
        self.text = text

    def __str__(self):
        return super().__str__() + f"TXT\t\"{self.text}\""

'''
A DNS zone.
'''
class Zone:
    def __init__(self, origin: DomainName, rrs: List[RR]):
        self.origin = origin
        self.rrs = rrs
    
    def __str__(self):
        return "\n".join(map(str, self.rrs))