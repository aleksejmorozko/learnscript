param ($s)
#первый вариант через массив
#[array]$a = $s.Split(' ')
#for([int]$i=0; $i -lt $a.length; $i++){
#    if ($a[$i] -match '([a-z]+-|_[a-z]+)'){
#        echo $a[$i]
#    }
#}
#второй вариант только череза регулярное выражение
$str = Select-String '([a-z]+(-|_)[a-z]+)' -InputObject $s -AllMatches | foreach-object {$_.matches}
$str.value