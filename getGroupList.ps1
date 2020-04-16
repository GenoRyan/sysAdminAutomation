$logfile = "\\path\to\log.csv"

$Grps = Get-ADGroup -Filter{GroupCategory -eq "security"}
$results=Foreach ($Grp in $Grps){
  Get-ADPrincipalGroupMembership -Identity $Grp.SamAccountName | 
  Where-Object {$_.GroupCategory -eq "security"} |
    Select-Object @{N="PrincipalGroupName";e={$grp.name}}, 
      @{N="MemberOfGroup";e={$_.name}},GroupCategory 
}
$results | Export-csv $logfile -notypeinformation