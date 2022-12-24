# Terraform Two Tier Webapp

## Group Members

Jatharthan Tharmanandasivam 114518228<br>
Anuj Ramovtar Shekhawat 186170213<br>
Chathumi Rambukwella 107310229<br>

## Objective

The objective of this project is to deploy a scalable cloud arcitecutre using load balancer and auto scaling project using terraform for the deployment of the networking and web server infrastructure and also using github as source control of the project and for continuous deployment and integration

## Pre-requisites for project deployment


1. Creation of 3 Amazon S3 buckets for each of the three environments in amazon web services account and then updating the names of bucket in 
    1. Environment/dev/Networking/Config.tf file
    1. Environment/dev/Networking/Config.tf file
    1. Environment/dev/Networking/Config.tf file
    
1. Clone Github Repository using ssh method

1. Creation of keys in the ssh folder of the AWS environment


## Deployment process

1. Network Infrastrucutre Deployment

- For Deployment of the Dev Environment go to "Environment/Dev/Networking" folder and run terraform commands
        1. terraform init
        2. terraform plan
        3. terraform apply --auto-approve
        
    This 3 commands will deploy the networking infrastrucutre of the dev environment and whole project infrastructure will start working
    
- Similar to this for deployment of other envieonment networkiing infrasturucture use 
    1. production environment - "Environment/prod/Networking"
    1. Staging Environment - "Environment/staging/Networking"
    
- Note:- If one of the environnemt has been deployed then for deploying the second environment we need to destroy the first environment using the command
        terraform destroy --auto-approve

    
2. Webserver Infrasturure Deployment  - 
 For Deployment of the Dev Environment go to "Environment/Dev/Webserver" folder and run terraform commands
        1. terraform init
        2. terraform plan
        3. terraform apply --auto-approve
        
    This 3 commands will deploy the networking infrastrucutre of the dev environment and whole project infrastructure will start working
    
- Similar to this for deployment of other envieonment networkiing infrasturucture use 
    1. production environment - "Environment/prod/Webserver"
    1. Staging Environment - "Environment/staging/Webserver"


    



    
