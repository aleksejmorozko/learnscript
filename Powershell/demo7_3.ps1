param ($s)
$str = Select-String '([0-9]{1,3}\.){3}([0-9]{1,3})' -InputObject $s -AllMatches | foreach {$_.matches}
$str.value