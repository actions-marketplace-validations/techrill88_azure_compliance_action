# azure_compliance_action

This GitHub action helps in integrating Azure Compliance Testing as part of the CICD pipeline setup using GitHub. This action is based on [Chef InSpec](https://docs.chef.io/inspec/) and [Inspec-Azure](https://github.com/inspec/inspec-azure)

Compliance tests are separated from the GitHub action and passed as an optional parameter - compliance_test_profile_url
You can skip this parameter to test your initial configuraiton.

You can use either the Azure Compliance tests defined at [inspec-azure-compliance-check](https://github.com/ambilykk/inspec-azure-compliance-check) or use your own compliance test written using Chef InSpec. Pass the InSpec profile URL as a parameter, compliance_test_profile_url to the action.

## Release
GitHub Marketplace : https://github.com/marketplace/actions/azure-compliance-checker

# How to Use the Action

## Service Principal
Create an Azure Service Principal Account with a minimum of reader role assigned to subscription that you'd like to use this action against.

You should have the following pieces of information:

TENANT_ID

CLIENT_ID

CLIENT_SECRET

SUBSCRIPTION_ID

Store all these details in your GitHub secret and refer as part of the workflow

Follow the below steps to configure Azure Service Principal Account:

* Login to the Azure portal
* Click on Azure Active Directory
* Click on APP registrations
* Click on New application registration
* Fill in a name and select Web from the Application Type drop down. Save your application
* Note down Application ID (client_id)
* Click on Certificates & secrets
* Click on New client secret
* Create a new password (client_secret)
* Go to your subscription
* Note down Subscription ID
* Click Access control (IAM) and Add
* Select the reader role
* Select the application just created and save


## action in workflow

Include this action in your workflow. By default this action contains one complaince test for initial test. 
Sample test included with the action verify the existence of resource group as part of the targetted azure subscription. Use it for verifying the configurations.

Following is the sample code for integrating this action with your workflow

```
steps:
      - uses: actions/checkout@v2
      - uses: ambilykk/azure_compliance_action@main
        with:
          subscriptionId: ${{secrets.AZURE_SUB}}
          clientId: ${{secrets.CLIENTID}}
          clientSecret: ${{secrets.CLIENT_SECRET}}
          tenantId: ${{secrets.TENANTID}}
          compliance_test_profile_url: 'https://github.com/ambilykk/inspec-azure-compliance-check'
          
```

## Parameters

| Name                           | Required  | Description                                                                      |
|--------------------------------|------------|----------------------------------------------------------------------|
| subscriptionId                 | Yes | Azure Subscription Id; preferably from secrets    |
| clientId                       | Yes | Azure Client Id; preferably from secrets                                      |
| clientSecret                   | Yes | Azure Client Secret; preferably from secrets   |
| tenantId                       | Yes | Azure Tenant Id; preferably from secrets                                   |
| compliance_test_profile_url    | No | URL to the compliance test profile. `https://github.com/ambilykk/inspec-azure-compliance-check`    |


# License

The scripts and documentation in this project are released under the [MIT License](https://github.com/actions/download-artifact/blob/main/LICENSE)

