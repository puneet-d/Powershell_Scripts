# Created By : Puneet Dixit

#Import csv and assign to variable 
$getcsv = Import-Csv ./test.csv

#read client list
foreach($clients in Get-Content ./clients.txt){

# filter list of server Name from csv and assign to variable array
$array = $getcsv."Server Name"
$i = [array]::IndexOf($array, $clients)

# Using if loop to check if client is available in csv file and find the index value of it 
if ($getcsv."Server Name".Contains($clients) -eq "True"){ 
$i = [array]::IndexOf($array, $clients)

# find server, schedule and policy name and assign to related variable 
$Server_Name = $getcsv."Server Name"[$i]
$Schedule_Name = $getcsv."Schedule "[$i]
$Policy_Name = $getcsv."Policy Name"[$i] 

# Run command to start the backup
$NBUpath = "/usr/openv/netbackup/bin"
& "$NBUPath/bpbackup" -p $Policy_Name -i -s $Schedule_Name -h $Server_Name"
}else{
 write-Output "$clients not found."
}

}
