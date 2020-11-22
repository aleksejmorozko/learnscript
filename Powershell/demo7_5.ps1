param ($s)
$str = Select-String '[a-z]{6,}' -InputObject $s -AllMatches | foreach-object {$_.matches}
$str.value