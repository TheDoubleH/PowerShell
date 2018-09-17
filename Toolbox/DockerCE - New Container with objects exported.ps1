$ContainerName = 'nav2018'
$imageName = 'microsoft/dynamics-nav:2018-cu9-na'
$licenseFile = 'C:\ProgramData\NavContainerHelper\NAV2018License.flf'
$DeltaPath = 'C:\ProgramData\NavContainerHelper\Migration\DELTA'

$UserName = 'NAVUser'
$Password = ConvertTo-SecureString "NAVUser123" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)

New-NavContainer `
    -accept_eula `
    -containerName $ContainerName `
    -auth NavUserPassword `
    -credential $Credential `
    -includeCSide `
    -licensefile $licenseFile `
    -imageName $imageName `
    -updateHosts