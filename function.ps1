function Server-Backup {

$hostname  = $args[0]
$IP = $args[1]
write-output "IP of $hostname is : $IP"
}

Server-Backup server001 192.168.1.10
