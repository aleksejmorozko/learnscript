[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, HelpMessage="Enter name or IP PC")]
    [string]$name
)
$user = Get-Credential #-UserName Administrator
Invoke-Command -ScriptBlock {
    Test-ComputerSecureChannel –Repair
} -ComputerName $name -Credential $user
