echo "Goodbye"
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec 
export AZURE_SUBSCRIPTION_ID= $Azure_subscriptionId
export AZURE_CLIENT_ID=$Azure_clientId
export AZURE_CLIENT_SECRET=$Azure_clientSecret
export AZURE_TENANT_ID=$Azure_tenantId
inspec exec . -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent
inspec exec inspec.yml -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent

#REM inspec exec inspec.yml -t azure:// https://github.com/dev-sec/ssl-baseline --reporter cli junit:testresults.xml html:report.html
