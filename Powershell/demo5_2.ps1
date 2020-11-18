class CustomObj {
    [string]$str

    CustomObj(){
    }

    SetString( [string]$str ){
        $this.str = $str
    }
    [string]PrintString(){
        return $this.str.ToUpper()
    }
}