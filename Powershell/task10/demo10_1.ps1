# Write a script to list directory that contain files. Output is the 
# same with Get-ChildItem cmdlet. Print file size in megabytes (Mb).

Get-ChildItem D:\Photo\Minolta_beercan -File | Select-Object `
    Name, @{Label="Size"; Expression={ '{0:N3}' -f ($_.Length/1MB)}}
