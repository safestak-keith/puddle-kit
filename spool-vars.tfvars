ssh-allow = ["188.31.37.229","51.104.150.169"] # Only enable rule if absolutely needed
pool-location = "eastus"
resource-prefix = "ss-mn-use-spl"
storage-prefix = "ssmnusespl"
vm-username = "ss"
corevm-size = "Standard_Ds2_v2"
corevm-nic-accelerated-networking = true
corevm-comp-name = "c"
core-node-port = "3000"
relayvm-size = "Standard_Ds2_v2"
relayvm-nic-accelerated-networking = true
relayvm-comp-name = "r"
relay-node-port = "3001"
# Tags
tag-platform = "spool"
tag-stage = "mn"
tag-data-classification = "safe-internal"