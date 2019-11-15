dotnet publish .\src\HelloWorld.csproj

$publishFolder = Resolve-Path ".\src\bin\Release\netcoreapp2.1\publish"
$current = Resolve-Path .
$publishZip = Join-Path $current "helloworld.zip"

if (Test-path $publishZip) {
    Remove-item $publishZip
}
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($publishFolder, $publishZip)

az functionapp deployment source config-zip --src $publishZip -n "func-helloworld-app" -g "func-helloworld"