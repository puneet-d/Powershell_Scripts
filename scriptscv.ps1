$getcsv = Import-Csv ./test.csv

foreach($clients in Get-Content ./clients.txt){
$array = $getcsv."Server Name"
$i = [array]::IndexOf($array, $clients)
if ($getcsv."Server Name".Contains($clients) -eq "True"){ 
$i = [array]::IndexOf($array, $clients)
$Server_Name = $getcsv."Server Name"[$i]
$Schedule_Name = $getcsv."Schedule "[$i]
$Policy_Name = $getcsv."Policy Name"[$i] 
Write-Output "bpbackup -p $Policy_Name -i -s $Schedule_Name -h $Server_Name"
}else{
 write-Output "$clients not found."
}

}
