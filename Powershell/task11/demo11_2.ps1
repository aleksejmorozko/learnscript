# Write a script to sort words in alphabet order from specific file and 
# put them into 26 text files named A.txt, B.txt, and so on up to Z.txt.

Get-Content D:\EPAM\course_fundamentals\text.txt -Raw | %{
    $_ -replace '(\d*)?(\.)?(\;)?(\,)?(\[\d+])?(\")?(\$)?', ''
} | %{
    $_ -replace '(\s){2,}', ' '
} | %{
    $_.ToString().ToLower().Split(" ")
} | Group-Object | %{
    $n=".\folder\$($_.Name[0]).txt"
    if (Test-Path $n){
        Add-Content "$n" $_.Name -Force
    }else {
        New-Item -ItemType 'file' -Path "$n" -Force;
        Add-Content "$n" $_.Name -Force
    }     
}

