# Write a script that it converts dash/underscore delimited words into camel and pascal casing.
class Converse{
    Converse(){
    }
    [string]MakeString([string]$str){
        [array]$s=$str.ToCharArray()
        [string]$ns=""
        for([int]$i=0; $i -lt $s.length; $i++){
            if( $s[$i] -ne "_" -and $s[$i] -ne "-" ){
                $ns += $s[$i]
            }else{
                $i++
                $ns += ($s[$i]).ToString().ToUpper()
            }
        }
    return $ns
    }
}