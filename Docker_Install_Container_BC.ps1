$MyContainer = "bc-ru"
$ImageName = "mcr.microsoft.com/businesscentral/onprem:ru"
$LicenseFile = "C:\Dev\Navicon D365 Bus Central till 2019-08.flf"
$pass = "Navicon2019"

docker stop $MyContainer
docker rm -v $MyContainer

#$additionalParameters = @("--env clickonce=Y")
$Password = ConvertTo-SecureString -String $pass -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:USERNAME, $Password

New-NavContainer -containerName $MyContainer `
    -accept_eula `
    -updatehosts `
    -auth NavUserPassword -Credential $credential `
    -imageName $ImageName `
    -includeCSide `
    -useBestContainerOS `
    -doNotExportObjectsToText `
    -licenseFile $LicenseFile
    #-additionalParameters $additionalParameters
