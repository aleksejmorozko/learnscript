# Write a script to get list of process (ex. All chrome process) 
# and put Name, Id, StartTime, PagedMemorySize in CSV/XML/JSON/YAML files where possible.


Get-Process -Name "chrome" | Select-Object Name, Id, StartTime, PagedMemorySize | `
    Export-Csv -Path "D:\EPAM\course_fundamentals\folder\crome.csv"
Get-Content D:\EPAM\course_fundamentals\folder\crome.csv
Get-Process -Name "chrome" | Select-Object Name, Id, StartTime, PagedMemorySize | `
    ConvertTo-Json | Out-File "D:\EPAM\course_fundamentals\folder\crome.json"
Get-Content D:\EPAM\course_fundamentals\folder\crome.json
Get-Process -Name "chrome" | Select-Object Name, Id, StartTime, PagedMemorySize | `
    ConvertTo-Xml | Out-File "D:\EPAM\course_fundamentals\folder\crome.xml"
Get-Content "D:\EPAM\course_fundamentals\folder\crome.xml"
Get-Process -Name "chrome" | Select-Object Name, Id, StartTime, PagedMemorySize | `
    ConvertTo-Yaml | Out-File "D:\EPAM\course_fundamentals\folder\crome.yaml"
Get-Content "D:\EPAM\course_fundamentals\folder\crome.yaml"