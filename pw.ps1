$st = 2
switch ($st){
    6 {Write-Host "6"}
    $(1..5) {Write-host $st}
    default {Write-Host "fsdf"}
}
write-host $(1..5)