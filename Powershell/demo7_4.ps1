param ($s)
$s = (Select-String "(\d{2})-(\d{2})-(\d{4})" -InputObject $s -AllMatches | foreach {$_.matches}).value
$d=[DateTime]::ParseExact($s, "MM-dd-yyyy", $null).ToString("dd-MM-yyyy")
echo ($d)