class Dice{
    [int]$Max
    [int]$Min
    
    Dice() {
        $this.Min = 0
        $this.Max = 7
    }

    Dice( [int]$min, [int]$max ){
        $this.Min = $min
        $this.Max = $max
    }

    [int]Roll() {
        return Get-Random -Minim $this.Min -Maximum $this.Max
    }
}