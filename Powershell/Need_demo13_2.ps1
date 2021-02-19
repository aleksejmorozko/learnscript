Write a script to get all interactive and remote logon sessions for the selected remote computer. 
And for every session find associated user information.

Hint: use classes Win32_LogonSession and Win32_Account.

$user=Get-Credential
$name=@("172.16.0.11")
Get-WmiObject -Class Win32_LogonSession | Select-Object logontype
Get-WmiObject -Class Win32_Account | gm


Get-WmiObject -Class Win32_Account -ComputerName $name -Credential $user | Select-Object * sid, name, description
Get-WmiObject -Class Win32_LogonSession -ComputerName $name -Credential $user | Select-Object *
