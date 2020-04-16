$path = "\\path\to\file.txt"
$dns1 = "1.1.1.1"
$dns2 = "2.2.2.2"
$hostnames = Get-Content -Path "$path"

foreach($hostname in $hostnames) {
    # The servers that we want to use
    $newDNSServers = "$dns1","$dns2"

    # Get all network adapters that already have DNS servers set
    $adapters = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $hostname | Where-Object {$_.DNSServerSearchOrder -ne $null}

    # Set the DNS server search order for all of the previously-found adapters
    $adapters | ForEach-Object {$_.SetDNSServerSearchOrder($newDNSServers)}
    }