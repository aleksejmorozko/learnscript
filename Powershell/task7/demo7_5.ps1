#Write a script to find all words which are at least 6 characters long in a string.
param ($s)
$str = Select-String '[a-z]{6,}' -InputObject $s `
    -AllMatches | foreach-object {$_.matches}
$str.value