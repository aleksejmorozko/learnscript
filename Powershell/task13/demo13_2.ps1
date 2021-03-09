# Write a script to get all interactive and remote logon 
# sessions for the selected remote computer. 
# And for every session find associated user information.
# Hint: use classes Win32_LogonSession and Win32_Account.

$user=Get-Credential
$name=@("172.16.0.11")
$s = New-CimSession -ComputerName $name -Credential $user

$name_s = (Get-CimInstance -ClassName Win32_LoggedOnUser -CimSession $s ).Antecedent.Name | Get-Unique
$name_a = (Get-CimInstance -ClassName Win32_Account -CimSession $s).Name


foreach($n in $name_s){
    foreach($m in $name_a){
        if($m -eq $n){
            Write-host $m
        }        
    }
}