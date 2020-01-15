# https://mcr.microsoft.com/v2/businesscentral/onprem/tags/list

$MyContainer = "bc-ru"
$ImageName = "mcr.microsoft.com/businesscentral/onprem:ru"
$LicenseFile = "D:\Dev\UK Navicon 6133288 (D365 BC 15 dev).flf"
$pass = "Navicon2019"

docker stop $MyContainer
docker rm -v $MyContainer

$Password = ConvertTo-SecureString -String $pass -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:USERNAME, $Password

New-NavContainer -containerName $MyContainer `
    -accept_eula -updatehosts `
    -auth NavUserPassword -Credential $credential `
    -imageName $ImageName `
    -licenseFile $LicenseFile `
    -useBestContainerOS