# Write a script that matches a word at the end of string.
param ($s)
$str = Select-String '\s[a-z]+$' -InputObject $s `
    -AllMatches | foreach-object {$_.matches}
$str.value