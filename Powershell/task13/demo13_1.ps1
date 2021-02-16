# Write a script to get from selected remote computer the following data:

#                    CPU model and max clock speed
#                    Amount of RAM (total, free)
#                    OS disk free space
#                    OS version
#                    Installed hot fixes
#                    List of stopped services

$user=Get-Credential
$name=@("172.16.0.11")

Invoke-Command -ScriptBlock{ 
    Get-Service | %{ if ($_.Status -eq "Stopped"){ Write-Host $_.Status, $_.Name } } 
} -ComputerName $name -Credential $user

Get-WmiObject -Class win32_processor -ComputerName $name `
    -Credential $user | Select-Object name, maxclockspeed 
Get-WmiObject Win32_OperatingSystem -ComputerName $name -Credential $user | %{ 
    Write-Output ('Free memory: ' + "{0:N2}" -f ($_.FreePhysicalMemory/1MB))
    Write-Output ('Full memory: ' + "{0:N2}" -f ($_.TotalVisibleMemorySize/1MB))
}
Get-WmiObject win32_logicaldisk -ComputerName $name -Credential $user | %{
    if ($_.DeviceID -eq "C:"){
        Write-Output "Free space C: $('{0:N2}' -f ($_.FreeSpace/1GB))"
        Write-Output "Full size C:  $('{0:N2}' -f ($_.Size/1GB))"
    }
}
Get-WmiObject Win32_OperatingSystem -ComputerName $name `
    -Credential $user | Select-Object Name, Version
Get-HotFix -ComputerName $name -Credential $user
