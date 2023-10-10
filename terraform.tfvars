
address_space = ["10.0.0.0/16", "192.168.0.0/24", "172.16.0.0/12", "10.0.2.0/23"]
tag1 = { environment = "dev", owner = "leodeoraff", purpose = "demonstration" }
tag2 = { resource = "virtualmachine", costcenter = "demo" }
tags = { environment="demo",owner="leodeo",purpose="TFdemo"}
storageaccount = "leodeoraffsa"
containername = "leodeoraffsc-"
# resource_group_names = ["az-ae-devrg1", "az-se-devrg2", "az-ae-devrg3", "az-se-devrg4"]
resource_group_names = ["az-ae-devrg1", "az-se-devrg2"]