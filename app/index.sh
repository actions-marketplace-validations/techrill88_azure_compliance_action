
echo "Goodbye"
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec 
cp -r ${{ github.action_path }}/app/inspec-azure-check-profile .

export AZURE_SUBSCRIPTION_ID= $Azure_subscriptionId
export AZURE_CLIENT_ID=$Azure_clientId
export AZURE_CLIENT_SECRET=$Azure_clientSecret
export AZURE_TENANT_ID=$Azure_tenantId

#REM inspec exec . -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent
inspec check inspec-azure-check-profile
inspec exec inspec-azure-check-profile -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent

#REM inspec exec inspec.yml -t azure:// https://github.com/dev-sec/ssl-baseline --reporter cli junit:testresults.xml html:report.html
