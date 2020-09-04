#Total number of lines in file 

$file = Get-Content ./serverlist.txt
$count=$file.Length

# Read first Line and Split it 


foreach ($line in $file){

$server = $line.Split(",")[0]
$schedule = $line.Split(",")[1]
$policy = $line.Split(",")[2]

Write-Output "bpbackup -p $policy -i -s $schedule -h $server"

}
