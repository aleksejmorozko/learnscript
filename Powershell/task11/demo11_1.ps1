# Write a script to get 10 longest words chart and put them in separate file.

Get-Content D:\EPAM\course_fundamentals\text.txt -Raw | %{
    $_ -replace '(\d*)?(\.)?(\;)?(\,)?(\[\d+])?(\")?(\$)?', ''
} | %{
    $_ -replace '(\s){2,}', ' '
} | %{
    $_.ToString().ToLower().Split(" ")
} | Sort-Object Length | Select-Object -Last 10 | %{
    
    $n=".\folder\$($_).txt"
    New-Item -ItemType 'file' -Path "$n" -Force
    Add-Content "$n" $_ -Force
}