#Port scanner for  as PowerShell project for SOC Analyst course 2020

function invoke-PortScan{
    [cmdletBinding()]
    param(
        #
        [Parameter(Mandatory)]
        [string]$Target,

        [switch]$ResolveHost,

        [int[]]$ports = @(21,22,23,53,69,80,110,139,111,389,443,445)
    )

    $ping = New-Object -TypeName System.Net.NetworkInformation.Ping
    $pingStatus = $ping.send($Target)
    if ($pingStatus.Status -eq "Success"){
        write-host $Target "is up!"

        if($ResolveHost){
             try{
                 $hostname = [System.Net.Dns]::GetHostByAddress($PingStatus.Address).Hostname
                }catch{

                }} 
        
        if ($hostname){
             Write-Host "Hostname - " $hostname 
            }



        $ports | foreach-object{
            
            $client = New-Object System.Net.Sockets.TcpClient
            $beginConnect = $client.BeginConnect($Target, $_, $null, $null)
            Start-Sleep -Seconds 0.7
            if ($client.connected -eq ($True)){
                $result = "up"
                }
                else{
                    $result = "down"
                }

            write-host $_ "is", $result
           
            $client.close()
            }

        }
        else{
            write-host $Target "is down"
    }
    

}
