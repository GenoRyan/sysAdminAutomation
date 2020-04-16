$expdays = "0"

Search-ADAccount -AccountExpired -UsersOnly | Where-Object {$_.accountexpirationdate -lt (get-date).AddDays(-$expdays) -and $_.enabled}