param buildNumber string

param location string = resourceGroup().location

module storageAccounts 'br/public:avm/res/storage/storage-account:0.15.0' = {
  name: 'storageAccountDeployment'
  params: {
    // Required parameters
    name: 'sa${uniqueString(deployment().name)}'
    // Non-required parameters
    allowBlobPublicAccess: false
    location: location
    skuName: 'Standard_LRS'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
    tags: {
      PipelineBuildNumber: buildNumber
      DeployerObjectID: deployer().objectId
      Environment: 'Development'
    }
  }
}
