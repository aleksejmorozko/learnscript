# Write a script to get all interactive and remote logon 
# sessions for the selected remote computer. 
# And for every session find associated user information.
# Hint: use classes Win32_LogonSession and Win32_Account.

$user=Get-Credential
$name=@("172.16.0.11")
Get-WmiObject -Class Win32_LogonSession | Select-Object __RELPATH
Get-WmiObject -Class Win32_Account | Select-Object Qualifiers | Select-Object UUID


Get-WmiObject -Class Win32_Account -ComputerName $name -Credential $user | Select-Object * {if ($_.status -eq 'OK'){$_.Name}} #sid, name, description
Get-WmiObject -Class Win32_LogonSession -ComputerName $name -Credential $user | Select-Object * LogonId

Get-WmiObject -Class Win32_Account -ComputerName $name -Credential $user | Select-Object Lockout


$logons = Get-WmiObject win32_loggedonuser -computername $name -Credential $user

foreach ($logon in $logons){
    if ($logon.antecedent -match $user){
        $logonid = $logon.dependent.split("=")[1] 
        $session = Get-WmiObject win32_logonsession |? {$_.logonid -match $logonid}
    }
    if ($session.logontype -eq "10"){
        Write-host "You have an active Terminal Server session on server $($server)"
    }
}


