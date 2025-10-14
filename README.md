### steps:
1. `./ping-c <domain>`:
    - [ ] learn ICMP: **rfc792**
    - [ ] create ICMP lib
    - [ ] handle ip OR domain:
        - [ ] if domain, perform a DNS query
    - [ ] send icmp hello, wait for a icmp reply
    - [ ] print progress
    - [ ] handle app closing with signals
    - [ ] calculate statistics
    - [ ] print statistics


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
<APP> <DOMAIN> (<IP>) <REQUEST_DATA_SIZE>(<REQUEST_PACKET_SIZE>) bytes of data.
<RESPONSE_PACKET_SIZE> bytes from <dns_name?!!?!> (<IP>): icmp_seq=<PACKET_SENT_COUNTER> ttl=<TTL> time=<TIME>
^C
--- <DOMAIN> <APP> statistics ---
<PACKET_SENT_COUNTER> packets transmitted, <PACKET_RECEIVED_COUNTER> received, <PACKETS_LOSS> packet loss, time <TOTAL_APP_RUN_TIME> ms
rtt min/avg/max/mdev = <RTT_MIN>/<RTT_AVG>/<RTT_MAX>/<RTT_MDEV> ms


### ICMP