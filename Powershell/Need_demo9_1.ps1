# Write a script that it makes association with running services and process in Windows. 
# Put result in hash table. Use pipelines as match as possible.

$p = Get-Process | Group-Object Name | Select-object Name
$s = Get-Service | Select-Object Name, DisplayName
