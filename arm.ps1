$resourceGroup = "func-helloworld"
$location = "westeurope"
$storage = "helloworldstorage141"
$ai = "func-helloworld-ai"
# $appservicePlan = "helloworld"
$app = "func-helloworld-app"

# az configure --defaults location=westeurope group=func-helloworld

az group create -n $resourceGroup -l $location
# az appservice plan create -n $appservicePlan --sku FREE -g $resourceGroup -l $location
az storage account create -n $storage --sku Standard_LRS -g $resourceGroup -l $location
az resource create --resource-type "Microsoft.Insights/components" --properties "{\"Application_Type\":\"web\"}" -n $ai -g $resourceGroup
az functionapp create -n $app --runtime dotnet --storage-account $storage --app-insights $ai -g $resourceGroup --consumption-plan-location $location