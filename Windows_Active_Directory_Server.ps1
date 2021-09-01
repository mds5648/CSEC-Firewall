$DNS_IP_ADDRESS = "10.10.10.1"
<#
The rule is deigned to allow ingress traffic using the LDAPS protcol, which provides encryption that is not on a normal 
LDAP protocol that exists on port 389.
#>
New-NetFirewallRule -DisplayName "LDAPS" -Direction Inbound -LocalPort 636 -Protocol LDAPS -Action Allow

<#

#>
New-NetFirewallRule -DisplayName "DNS" -Direction Inbound -LocalPort 53 -LocalAddress $DNS_IP_ADDRESS -Protocol TCP,UDP -Action Allow

New-NetFirewallRule -DisplayGroup "Group Policy" -Direction Outbound -Action Allow