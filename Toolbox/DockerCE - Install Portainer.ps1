Write-Host "Installing Portainer, for Windows Containers - Requiring not authentication"

Write-Host "Creating folder c:\ProgramData\portainer"
md c:\ProgramData\portainer

Write-Host "Creating docker volume portainer_data mapped to c:\ProgramData\portainer"
docker volume create portainer_data

Write-Host "Downloading and creating portainer"
docker run -d -p 9000:9000 --name portainer --restart always -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -v C:\ProgramData\Portainer:C:\data portainer/portainer --no-auth

Write-Host "Launching portainer"
Start-Process "http://localhost:9000"
