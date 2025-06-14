param subnetName string
param vnetName string
param subnetAddressPrefix string
param routeTableId string
param networkSecurityGroupId string

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${vnetName}/${subnetName}'
  properties: {
    addressPrefix: subnetAddressPrefix
    routeTable: routeTableId=='' ? null : {
      id: routeTableId
    }
    networkSecurityGroup: {
      id: networkSecurityGroupId
    }
  }
}

output subnetId string = subnet.id

