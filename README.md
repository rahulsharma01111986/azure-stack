The code represents the three tier application architecture that organizes applications into three logical computing tiers:

a. Web Tier or Presentation tier .It can be user interface.
b. Application tier or Business Tier.It processes the user interactions and makes logical decisions.
c. Data Tier where the application storage is stored.

Here we have used the below following resources:

1. One virtual Network is created and three subnets are carved out of it for web tier, app tier and data tier.
2. Each subnet will have one virtual machine.
3. Only First Virtual Machine(Web VM) will be allowed inbound traffic from internet.
4. Second Virtual machine (App VM) will entertain traffice from web vm only and can reply the virtual machine again.
5. App vm can connect to database vm and database vm can connect to app vm, but database vm cannot connect to web vm.

To achieve the solution, we have created different modules in terraform. A module is a kind of container for multiple resources that are used together.
Here we have created four modules:

1. Resourcegroup- it would be used for creating a resource group
2. Networking - It would be used for creating Virtual network and subnets.
3. SecurityGroup- It would create NSGs, setting desired security rules and associating them to subnets.
4. Compute: It would create AV sets, Network Interfaces and Virtual Machines
