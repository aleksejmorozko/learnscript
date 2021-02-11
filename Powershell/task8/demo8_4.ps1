#Write a script to create the multiplication table (from 1 to 10) of a number.
param($s)
for($i=1; $i -le 10; $i++){
    $p=$s*$i
    write-output("$p = $s x $i")
}