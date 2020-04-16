$logfile = "\\path\to\log.txt"

$AllServers=Get-ADComputer -Filter {OperatingSystem -Like "Windows*"}
ForEach ($Server in $AllServers){
    Try{
        $Result = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled = 'True'" -Property DNSServerSearchOrder, DHCPEnabled -ComputerName $Server.Name -ErrorAction Stop
        $name = $Server.Name
        $dnslist = $Result.DNSServerSearchOrder
        $dhcp = $Result.DHCPEnabled
        $arrResults = "$name, $dnslist, $dhcp"

        $arrResults | Out-File $logfile -Append
    }
    Catch{
        $name = $Server.Name
        $arrResults = "$name, na, na"
    
        $arrResults | Out-File $logfile -Append
    }
}