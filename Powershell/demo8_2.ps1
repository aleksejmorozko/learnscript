#Write a script to get the Fibonacci series between 0 to N.
param($s)
[array]$f=(1, 1)
[int]$i=2
Do{   
    $f +=$f[$i-1]+$f[$i-2]
    $i++
}while($f[$i-1]+$f[$i-2] -lt $s)

write-output($f -join " ")