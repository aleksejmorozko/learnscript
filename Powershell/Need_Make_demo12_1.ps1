Write a script to get list of process (ex. All chrome process) and put Name, Id, StartTime, PagedMemorySize in CSV/XML/JSON/YAML files where possible.


Get-Process | Con
$xml = [xml]$(Get-Process -Name "web*" | ConvertTo-Xml -Dept 2)


Get-Process | ConvertTo-Json | Set-Content -Path .\test_conver_to.json
$jsondata = get-content ./test_conver_to.json | ConvertFrom-Json
