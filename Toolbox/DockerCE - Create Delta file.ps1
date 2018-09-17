# Compare two sets of text files and create a delta file

# NAV 2018 cu6 na Original-11.0.22292.0-na
# NAV 2018 cu8 na Original-11.0.23572.0-na
# NAV 2018 cu9 na Original-11.0.24232.0-na

#
#Import-NAVModules
#

$DeltaPath = 'C:\ProgramData\NavContainerHelper\Migration\DELTA'
$PreviousVersionPath = 'C:\ProgramData\NavContainerHelper\Extensions\Original-11.0.23572.0-na\*.txt'
$NewVersionPath = 'C:\ProgramData\NavContainerHelper\Extensions\Original-11.0.24232.0-na\*.txt' 

Write-Host "Reset Delta Path"
$null = Remove-Item -Path $DeltaPath -Recurse -Force -ErrorAction SilentlyContinue
$null = New-Item -Path $DeltaPath -ItemType Directory 

Write-Host "Comparing Objects"
Compare-NAVApplicationObject `
    -OriginalPath $PreviousVersionPath `
    -ModifiedPath $NewVersionPath `
    -DeltaPath $DeltaPath 