#FirstName,LastName,Department,DefaultPassword,Enabled,ChangePasswordAtLogon

#$user = Get-Credential
Import-Csv .\user_t.csv | %{
    Invoke-Command -ScriptBlock {param($name,$lname,$dpt,$pass,$enabled,$chpass)
        write-host $name,$lname,$dpt,$pass,$enabled,$chpass
        New-ADUser -Name $name -Surname $lname -Department $dpt `
            -AccountPassword (ConvertTo-SecureString $pass -AsPlainText -force) -passThru `
            -Enabled $enabled -ChangePasswordAtLogon $chpass
    } -ComputerName 192.168.100.10 -Credential $user `
        -ArgumentList $_.FirstName,$_.LastName,$_.Department,$_.DefaultPassword,$true,$false
}
#Invoke-Command -ScriptBlock{
#    New-ADUser -Name "aleksej" -Surname "morozko" -Department "it" `
#        -AccountPassword (ConvertTo-SecureString "QAZxsw21" -AsPlainText -force) -Enabled $true 
#} -ComputerName 192.168.100.10 -Credential $user 