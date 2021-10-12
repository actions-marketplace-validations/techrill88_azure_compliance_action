
echo "Goodbye  : $1 "

echo ${{ inputs.subscription_id }} 
echo $INPUT_SUBSCRIPTION_ID


curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec 
cp -r $1/app/inspec-azure-check-profile .

export subscription_id= $2
export client_id=$3
export client_secret=$4
export tenant_id=$5

#REM inspec exec . -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent
inspec check inspec-azure-check-profile --chef-license accept-silent
inspec exec inspec-azure-check-profile -t azure:// --reporter cli junit:testresults.xml html:report.html --chef-license accept-silent

#REM inspec exec inspec.yml -t azure:// https://github.com/dev-sec/ssl-baseline --reporter cli junit:testresults.xml html:report.html

#REM :tenant_id, :client_id, :client_secret, :subscription_id