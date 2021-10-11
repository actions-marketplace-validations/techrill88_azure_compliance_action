
echo "Goodbye  : $1 "
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec 
cp -r $1/app/inspec-azure-check-profile .

export :subscription_id= $Azure_subscriptionId
export :client_id=$Azure_clientId
export :client_secret=$Azure_clientSecret
export :tenant_id=$Azure_tenantId

#REM inspec exec . -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent
inspec check inspec-azure-check-profile --chef-license accept-silent
inspec exec inspec-azure-check-profile -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent

#REM inspec exec inspec.yml -t azure:// https://github.com/dev-sec/ssl-baseline --reporter cli junit:testresults.xml html:report.html

#REM :tenant_id, :client_id, :client_secret, :subscription_id