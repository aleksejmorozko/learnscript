# Write a script that it makes association with running services and process in Windows. 
# Put result in hash table. Use pipelines as match as possible.

$p = Get-Process | Group-Object Name | Select-object Name
$s = Get-Service | Select-Object Name, DisplayName
$maxp=0; $maxs=0; $line = '';
foreach ($pn in $p.Name) {
    if ($pn.Length -gt $maxp) {
        $maxp = $pn.Length        
    }
}
$maxp += 3
foreach ($sn in $s.Name) {
    if ($sn.Length -gt $maxs) {
        $maxs = $sn.Length        
    }
}
$maxs += $maxp;
for ($i = 0; $i -lt $maxs; $i++) {
    $line += "_"
}
$line += "`n"
$line
foreach($pn in $p){
    foreach ($sn in $s) {
        $pnn = $pn.Name -replace '(_)?(-)?', ''
        $snn = $sn.Name -replace '(_)?(-)?', '' 
        if ( $snn -eq $pnn ) {
            for ($i = $pnn.Length; $i -lt $maxp; $i++) {
                $pnn += " "
            }
            Write-Host  $pnn, $sn.DisplayName | Format-Table
        }
    }
}
$line