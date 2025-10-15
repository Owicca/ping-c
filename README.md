### setup:
1. `make`
2. `make clean`

-----------------------

### implementation steps:
1. `./ping-c <domain>`:
    - [ ] learn ICMP: **rfc792** and extensions(**rfc4884**)
    - [ ] create ICMP lib
    - [ ] handle ip OR domain:
        - [ ] if domain, perform a DNS query
    - [ ] send icmp hello, wait for a icmp reply
    - [ ] print progress
    - [ ] handle app closing with signals
    - [ ] calculate statistics
    - [ ] print statistics

-----------------------

simple ping output:
--------------------------------------------------------
PING google.com (142.250.187.142) 56(84) bytes of data.  
64 bytes from sof02s45-in-f14.1e100.net (142.250.187.142): icmp_seq=1 ttl=115 time=54.8 ms  
64 bytes from sof02s45-in-f14.1e100.net (142.250.187.142): icmp_seq=2 ttl=115 time=54.4 ms  
^C  
--- google.com ping statistics ---  
2 packets transmitted, 2 received, 0% packet loss, time 1002ms  
rtt min/avg/max/mdev = 54.360/54.588/54.817/0.228 ms
--------------------------------------------------------
```
<APP> <DOMAIN> (<IP>) <REQUEST_DATA_SIZE>(<REQUEST_PACKET_SIZE>) bytes of data.  
<RESPONSE_PACKET_SIZE> bytes from <dns_name?!!?!> (<IP>): icmp_seq=<PACKET_SENT_COUNTER> ttl=<TTL> time=<TIME>  
^C  
--- <DOMAIN> <APP> statistics ---  
<PACKET_SENT_COUNTER> packets transmitted, <PACKET_RECEIVED_COUNTER> received, <PACKETS_LOSS> packet loss, time <TOTAL_APP_RUN_TIME> ms  
rtt min/avg/max/mdev = <RTT_MIN>/<RTT_AVG>/<RTT_MAX>/<RTT_MDEV> ms
```

-----------------------

### ICMP:
- it only concerns errors in fragment 0 of a datagram (0th fragment usually contains the IP header and first 64 of the body)

### ICMP fields:
- echo or echo reply:
    - type:
        0. echo reply
        8. echo hello
    - code: always 0
    - checksum:
        - ones_complement(ones_complement(type) + ones_complement(code) + ones_complement(checksum) + ones_complement(body))
        - checksum field is 0 when computing ones_complement
        - if total length is odd, padd until even, THEN compute
    - identifier: if code = 0, mai contain an identifier to aid in matching echo hello and reply, may be 0
    - sequence number: if code = 0, mai contain a sequence number to aid in matching echo hello and reply, may be 0
    - description: data received in echo hello, must be returned in reply, may aid in matching hellor and reply