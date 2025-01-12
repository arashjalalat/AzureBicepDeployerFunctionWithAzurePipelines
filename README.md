# AzureBicepDeployerFunctionWithAzurePipelines

This project includes a Bicep template with an Azure storage account and the `deployer()` function. The deployment is performed with Azure Pipelines.

## Bicep template

The Bicep template located at `infra/storageAccount.bicep` defines the deployment of an Azure Storage Account with the following parameters:
- `tags`: Object containing tags to be applied to the storage account.
- `location`: Location where the storage account will be deployed.

The template uses the `br/public:avm/res/storage/storage-account:0.15.0` module to create the storage account with the following settings:
- `name`: Generated using a unique string based on the deployment name.
- `allowBlobPublicAccess`: Set to `false`.
- `location`: Set to the provided location parameter.
- `skuName`: Set to `Standard_LRS`.
- `networkAcls`: Configured to bypass Azure services and deny other access.
- `tags`: Merged with additional tags including `DeployerObjectID` and `Environment`.

## Azure Pipelines

The Azure Pipelines configuration file located at `pipelines/azure-pipelines.yml` defines a pipeline with the following steps:
- Trigger: None (manual trigger).
- Pool: Uses the `ubuntu-latest` VM image.
- Variables: Defines the `resourceGroupName` variable for the resource group name.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.