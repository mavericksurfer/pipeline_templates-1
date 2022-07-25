/* 
******************  
    Literals
****************** 
*/

// Resource type prefixes
var storageAccountPrefix = 'st'

/* 
******************  
    Parameters
****************** 
*/

// ** General
param applicationName string 
param location string 
param env string 

/* 
******************  
    Resources
****************** 
*/

var appNameEnvLocationSuffix  = '${applicationName}${env}'

// Storage Account

var storageAccountName  = '${storageAccountPrefix}${appNameEnvLocationSuffix}' 

resource attachmentStorage 'Microsoft.Storage/storageAccounts@2019-06-01' = {
    name: storageAccountName
    location: location
    sku: {
        name: 'Standard_LRS'
        tier: 'Standard'
    }
    kind: 'StorageV2'
    properties: {
        accessTier: 'Hot'
        minimumTlsVersion: 'TLS1_2'
        supportsHttpsTrafficOnly: true
        allowBlobPublicAccess: true
        networkAcls: {
            bypass: 'AzureServices'
            defaultAction: 'Allow'
            ipRules: []
        }
    }
}
