
$items = (Get-VM | Out-String )
# Создаем массив из строк
$a=@(); $a=$items.Split("`n"); $max=0;
function maxNum{
    [CmdletBinding()]
    param (
        $aaa
    )
    $aa=@()
    foreach ($item in $aaa[0..$aaa.Length]) {    
        $b=@(); $b=$item -Split '\s+'; $i=0;
        foreach($bb in $b){
            if( $bb.length -gt $aa[$i]){
                $aa[$i] = $bb.length
            }
            $i++
        }
    }
    return $aa
}
maxNum $a

function addSpace {
    [CmdletBinding()]
    param (
        $c,
        $len
    )
    for ($i = 0; $c.Length -lt $len; $i++) {
        $c += ' '
    }
    return $c
}


foreach ($item in $a[0..$a.Length]){
    $b=@(); $b=$item -Split '\s+';
    switch ($b[1]){
        "Running" { addSpace $b[0] $(maxNum $b[0] 0)}  Write-Host $b[0], $b[1] -ForegroundColor Green}
        "Saved" { for ($i = $b[0].length; $i -le $max; $i++){$b[0] += ' ';} `
            Write-Host $b[0], $b[1] -ForegroundColor Yellow}
        "Off" { for ($i = $b[0].length; $i -le $max; $i++){$b[0] += ' ';} `
            Write-Host $b[0], $b[1] -ForegroundColor DarkBlue}
        default { for ($i = $b[0].length; $i -le $max; $i++){$b[0] += ' ';} `
            Write-Host $b[0], $b[1] -ForegroundColor White}
    }
}