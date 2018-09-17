$ObjectFilePath = 'C:\ProgramData\NavContainerHelper\Migration\CustomerNameHere'
$ObjectFileName = (join-path $ObjectFilePath 'Original.txt')

$LogFilePatch = 'C:\ProgramData\NavContainerHelper\Migration\CustomerNameHere-Log'

Write-Host "Reset Object File Path"
$null = Remove-Item -Path $ObjectFilePath -Recurse -Force -ErrorAction SilentlyContinue
$null = New-Item -Path $ObjectFilePath -ItemType Directory 
$null = Remove-Item -Path $LogFilePath -Recurse -Force -ErrorAction SilentlyContinue
$null = New-Item -Path $LogFilePath -ItemType Directory 

Write-Host "Exporting and Splitting objects"
Export-NAVApplicationObject2 `
    -ServerInstance DynamicsNAV110 `
    -Path $ObjectFileName `
    -ExportTxtSkipUnlicensed `
    -LogPath $LogFilePatch

Write-Host "Split the objects"
Split-NAVApplicationObjectFile `
    -Source $ObjectFileName `
    -Destination $ObjectFilePath

Write-Host "Remove Full Files"
Remove-Item -Path "$ObjectFileName"