class CustomObj {
    
    CustomObj(){

    }
    [string]Reverse( [string]$str ){
        [int]$t = $str.length
        [string]$str1 = ""
        for($t; $t -gt 0; $t--){
            $str1 += $str[$t-1]
        }
        return $str1
    }

}