using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

$Object1 = [PSCustomObject]@{
    Server = 'Server1'
    CPU = 10
} | ConvertTo-Json

$Object2 = [PSCustomObject]@{
    Server = 'Server2'
    CPU = 20
} | ConvertTo-Json

# Interact with query parameters or the body of the request.
$message = @( $Object1, $Object2)
Push-OutputBinding -Name Msg -Value $message
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = 200
    Body = "OK"
})