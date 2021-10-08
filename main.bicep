param rg_dnszone_name string = 'rg-dnszone-fundenusecomni'
param dnsZoneName string = 'fundenuse.com.ni'

targetScope = 'subscription'

resource rgdnsZone 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rg_dnszone_name
  location: 'eastus'
  tags: {
    ENV: 'PRO'
  }
}

module dnszone './dnszone.bicep' = {
  name: dnsZoneName
  scope: rgdnsZone
  params: {
    dnsZoneName: dnsZoneName
  }
}

module deployRgLock './lock.bicep' = {
  name: 'lockDeployment'
  scope: resourceGroup(rgdnsZone.name)
}
