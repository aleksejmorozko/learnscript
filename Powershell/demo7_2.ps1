param ($s)
$str = Select-String '\s[a-z]+$' -InputObject $s -AllMatches | foreach {$_.matches}
$str.value