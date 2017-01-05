param (
    [switch]$buildId
)

$tfsAPI = "$(ENV:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)/$(ENV:SYSTEM_TEAMPROJECT)/_apis/build"

$base64authinfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f "", $(ENV:SYSTEM_ACCESSTOKEN))))
$header = @{Authorization=("Basic {0}" -f $base64authinfo)}


(New-Object System.Net.WebClient).Proxy.Credentials =  [System.Net.CredentialCache]::DefaultNetworkCredentials

 $body = @{
            definition = @{
            id=$buildId
            }
        } | ConvertTo-Json
            
##Build 
Invoke-WebRequest -Method Post -ContentType "application/json" -Uri "$($tfsAPI)/builds?api-version=2.0" -Headers $header -Body $body

            


