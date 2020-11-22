# Write a script to convert temperatures to and from Celsius, Fahrenheit.
param($s)
if ($s[-1] -eq "F"){
    $s=Select-String '\d+' -InputObject $s -AllMatches | foreach-object {$_.matches}; 
    $i=($s.value-32)*5/9
    Write-output("$s is $i in Celsius")
}elseif ($s[-1] -eq "C") {
    $s=Select-String '\d+' -InputObject $s -AllMatches | foreach-object {$_.matches}; 
    $i=[int]$s.value*9/5 + 32
    Write-output("$s is $i in Fahrenheit")
}