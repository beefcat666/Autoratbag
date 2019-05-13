#!/bin/bash

ratbaglist=$(ratbagctl list)
substring=$(grep -o '.*:  ' <<<$ratbaglist)
device=${ratbaglist//$substring}

# "$(echo $var)" is the only way I've found to encase a variable in quotes that doesn't prepend a fucking space
ratbagctl "$(echo $device)" profile active set 1
ratbagctl "$(echo $device)" resolution active set 2

"$@"

ratbagctl "$(echo $device)" profile active set 0
ratbagctl "$(echo $device)" resolution active set 2
