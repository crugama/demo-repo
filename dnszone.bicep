param dnsZoneName string

resource dnszone 'Microsoft.Network/dnszones@2018-05-01' = {
  name: dnsZoneName
  location: 'global'
  tags: {
    ENV: 'PRO'
  }
  properties: {
    zoneType: 'Public'
  }
}

//MX Records
resource mailProtection_MX 'Microsoft.Network/dnszones/MX@2018-05-01' = {
  name: '${dnszone.name}/@'
  properties: {
    TTL: 300
    MXRecords: [
      {
        exchange: 'ASPMX.L.GOOGLE.COM'
        preference: 1
      }
      {
        exchange: 'ALT1.ASPMX.L.GOOGLE.COM'
        preference: 5
      }
      {
        exchange: 'ALT2.ASPMX.L.GOOGLE.COM'
        preference: 5
      }
      {
        exchange: 'ASPMX2.GOOGLEMAIL.COM'
        preference: 10
      }
      {
        exchange: 'ASPMX3.GOOGLEMAIL.COM'
        preference: 10
      }
    ]
    targetResource: {}
  }
}

// CNAME Records
resource CNAME_ftp 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  name: '${dnszone.name}/ftp'
  properties: {
    TTL: 300
    CNAMERecord: {
      cname: 'www'
    }
    targetResource: {}
  }
}

resource CNAME_calendar 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  name: '${dnszone.name}/calendar'
  properties: {
    TTL: 300
    CNAMERecord: {
      cname: 'ghs.googlehosted.com.'
    }
    targetResource: {}
  }
}

resource CNAME_mail 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  name: '${dnszone.name}/mail'
  properties: {
    TTL: 300
    CNAMERecord: {
      cname: 'ghs.googlehosted.com.'
    }
    targetResource: {}
  }
}

resource CNAME_docs 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  name: '${dnszone.name}/docs'
  properties: {
    TTL: 300
    CNAMERecord: {
      cname: 'ghs.googlehosted.com.'
    }
    targetResource: {}
  }
}

resource CNAME_sites 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  name: '${dnszone.name}/sites'
  properties: {
    TTL: 300
    CNAMERecord: {
      cname: 'ghs.googlehosted.com.'
    }
    targetResource: {}
  }
}

resource CNAME_contacts 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  name: '${dnszone.name}/contacts'
  properties: {
    TTL: 300
    CNAMERecord: {
      cname: 'ghs.googlehosted.com.'
    }
    targetResource: {}
  }
}



//TXT Records
resource record_TXT 'Microsoft.Network/dnszones/TXT@2018-05-01' = {
  name: '${dnszone.name}/@'
  properties: {
    TTL: 300
    TXTRecords: [
      {
        value: [
          'google-site-verification=Wgzmkxd4PydWeQri0VXb7zOBFVf2ue_dp4VnuXx2V-g'
        ]
      }
    ]
    targetResource: {}
  }
}


// A Records
resource ARecords 'Microsoft.Network/dnszones/A@2018-05-01' = {
  name :'${dnszone.name}/@'
  properties: {
    TTL: 300
    ARecords: [
      {
        ipv4Address: '178.63.48.152'
      }
    ]
    targetResource: {}
  }
}

resource ARecords_www 'Microsoft.Network/dnszones/A@2018-05-01' = {
  name :'${dnszone.name}/www'
  properties: {
    TTL: 300
    ARecords: [
      {
        ipv4Address: '178.63.48.152'
      }
    ]
    targetResource: {}
  }
}

resource ARecords_intranet 'Microsoft.Network/dnszones/A@2018-05-01' = {
  name :'${dnszone.name}/intranet'
  properties: {
    TTL: 300
    ARecords: [
      {
        ipv4Address: '45.55.91.167'
      }
    ]
    targetResource: {}
  }
}
