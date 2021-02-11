# Write a script to convert a date of mm-dd-yyyy format to dd-mm-yyyy format.
param ($s)
$s = (Select-String "(\d{2})-(\d{2})-(\d{4})" `
    -InputObject $s -AllMatches | foreach-object {$_.matches}).value
$d=[DateTime]::ParseExact($s, "MM-dd-yyyy", $null).ToString("dd-MM-yyyy")
write-output($d)