param (
    [string]$buildId
)

$tfsAPI = "$($env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI)/$($env:SYSTEM_TEAMPROJECT)/_apis/build"

 $body = @{
            definition = @{
            id=$buildId
            }
        } | ConvertTo-Json
            
##Build 
Invoke-RestMethod -Method Post  -ContentType "application/json" -Uri "$($tfsAPI)/builds?api-version=2.0" -Headers $header -Body $body -UseDefaultCredentials


            


