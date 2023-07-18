# **Infrastructure deployment of VM, VM Scale sets and AKS using Terraform**

In Capstone project 3,we created an automated provisioned infrastructure using Terraform, EKS cluster, EC2 instances. In this we will create similar in in azure using terraform, AKS and Virtual machine and VM scale sets.

For Virtual machine scale sets configuration, we would need to configure the below:

- Resource Group
- Virtual network
- Subnet
- Public ip
- Load balance and backend pools
- Virtual machine scale sets
- Virtual machine
- Public ip and network interface for the Virtual machine

## **Steps done:**

## **1. Check terraform setup:**

We will use terraform from azure cloud shell.

First we will check if the cloud shell has terraform:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.001.png)

It will already have the terraform.

Now we have to check the subsciption it is using:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.002.png)

It is using the correct subscription.

If you are using from other systems you will have to install azure cli and run `az login` command.

We will now create new directory for terraform and initalize the git because we want to send the files to git once we have completed the task for future use

##  **2. Write the script for a virtual machine and a Virtual machine scale sets:**

First we wil create _providers.tf_ file which will have provider and version details:

https://github.com/kotianrakshith/AzureProj4/blob/main/providers.tf

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.003.png)

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.004.png)

Next we will create _resourcegroup.tf_ :

https://github.com/kotianrakshith/AzureProj4/blob/main/resourcegroup.tf

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.005.png)

One for _randomstring.tf_:

https://github.com/kotianrakshith/AzureProj4/blob/main/randomstring.tf

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.006.png)

Next we will write for virtual network: _vn.tf_

https://github.com/kotianrakshith/AzureProj4/blob/main/vn.tf

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.007.png)

Next we will write for subnet: _subnet.tf_

<https://github.com/kotianrakshith/AzureProj4/blob/main/subnet.tf>

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.008.png)

Next we will write for publicip: _publicip.tf_

<https://github.com/kotianrakshith/AzureProj4/blob/main/publicip.tf>

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.009.png)

Next write for loadbalancer: _lb.tf_

https://github.com/kotianrakshith/AzureProj4/blob/main/lb.tf

This will include the load balancer, backend address pool, load balancer probe, load balancer rule:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.010.png)

Now you can write for virtual machine scale sets: _vmss.tf_

<https://github.com/kotianrakshith/AzureProj4/blob/main/vmss.tf>

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.011.png)

Now write the configuration for virtual machine: _vm.tf_

<https://github.com/kotianrakshith/AzureProj4/blob/main/vm.tf>

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.012.png)

We have created required files for the virtual machine scale sets:![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.013.png)

We will push it to github our porgress till here.

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.014.png)

We have added the files and comitted:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.015.png)

Then we can push using `git push -u origin main`

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.016.png)

We will have all the required files in github

## **3. Write terraform configuration file for AKS**

First we will create a new resource group for kubernetes cluser:

 _aksrg.tf_

https://github.com/kotianrakshith/AzureProj4/blob/main/aksrg.tf

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.017.png)

First we will write a configuration for log analytics workspace (optional), we can assign this to our aks cluser

 _loganalyticsworkspace.tf_

https://github.com/kotianrakshith/AzureProj4/blob/main/loganalyticsworkspace.tf

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.018.png)

Now we will write a configuration file for AKS:
_aks.tf_

<https://github.com/kotianrakshith/AzureProj4/blob/main/aks.tf>

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.019.png)

Now we will add this also to staging and commit it and push it to github.and then we will have all the files both in our system and github:

Github link: <https://github.com/kotianrakshith/AzureProj4>

## **4. Apply the terraform configuration**

First we will run initializing command to download required providers:

`terrafrom init`

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.020.png)

Then we will run terraform plan to check if there are any errors and if not, what are the resource which will be built:

`terraform plan`

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.021.png)

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.022.png)

Now we will run the apply command to build all this 16 resource

`terraform apply`

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.023.png)

This will prompt for approval, type yes 

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.024.png)

This will take some time and once all are created it will inform that all resource are created:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.025.png)

## **5. Check the deployed infrastructure**

First you can go to All resource in azure portal and you can see all the resource that is created

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.026.png)

Now you can check the required deployment:

VM: You can see our virtual machine is created in the resource group we specified

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.027.png)

VMSS: You can see that our scale set is created(One for AKS cluster, One which we created)

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.028.png)

AKS: You can go to kubernetes service and check that your cluster is created in mentioned resource group:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.029.png)

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.030.png)

That completes the building infrastrcutre using IaC tool Terraform. We can see all the required dependency are created with minimal time and the code can be reused.

## **6. Destroy the infrastructure:**

You can delete all the infrastructure using simple command: `terraform destroy`

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.031.png)

It will ask for approval:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.032.png)

Once completed all the resource will be deleted. You can check in all resources if ther resources has been removed:

![](/readmeimages/Aspose.Words.19640cd8-553d-4a62-8211-5784cce610f3.033.png)
