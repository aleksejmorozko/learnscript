class CustomObj{
    [int]$x
    [int]$y
    
    CustomObj() {
    }

    [int]Pow( [int]$x, [int]$y ){
        return [math]::Pow( $x, $y )
    }

}