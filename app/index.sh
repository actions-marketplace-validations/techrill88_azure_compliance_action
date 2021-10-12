
echo "Goodbye  : $1 "

echo $INPUT_SUBSCRIPTION_ID


curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec 
cp -r $1/app/inspec-azure-check-profile .

$env:AZURE_SUBSCRIPTION_ID=$INPUT_SUBSCRIPTION_ID
$env:AZURE_CLIENT_ID=$3
$env:AZURE_CLIENT_SECRET=$4
$env:AZURE_TENANT_ID=$5

#REM inspec exec . -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent
inspec check inspec-azure-check-profile --chef-license accept-silent
inspec exec inspec-azure-check-profile -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent

#REM inspec exec inspec.yml -t azure:// https://github.com/dev-sec/ssl-baseline --reporter cli junit:testresults.xml html:report.html

#REM :tenant_id, :client_id, :client_secret, :subscription_id