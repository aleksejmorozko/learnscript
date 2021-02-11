# Write a script to remove multiple spaces in a string.
param($s)
write-output ( $s -replace "\s+", " " )