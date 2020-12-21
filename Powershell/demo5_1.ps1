class CustomObj{
    [int]$x=5
    [int]$y=10
    
    CustomObj() {
    }

    [int]Pow( [int]$x, [int]$y ){
        return [math]::Pow( $x, $y )
    }

}