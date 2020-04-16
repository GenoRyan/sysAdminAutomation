$ouDistinguishedName = "OU=staff,OU=users,DC=example,DC=com"
$groupCN = "Your Group Here"

Get-ADUser -SearchBase $ouDistinguishedName -Filter * | ForEach-Object {Add-ADGroupMember -Identity $groupCN -Members $_}