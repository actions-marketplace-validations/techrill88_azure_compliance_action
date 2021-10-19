
echo "azure_compliance-action execution started"

# export the values as environment variables
export AZURE_SUBSCRIPTION_ID=$2
export AZURE_CLIENT_ID=$3
export AZURE_TENANT_ID=$4
export AZURE_CLIENT_SECRET=$5

# install the Chef Inspec
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec 

# execute the compliance tests from the profile, if available. 
# Otherwise, execute the sample available as part of the action
if [ ! -z "$INPUT_COMPLIANCE_TEST_PROFILE_URL" ]
then    
    inspec exec $INPUT_COMPLIANCE_TEST_PROFILE_URL -t azure:// --chef-license accept-silent
else
    cp -r $1/app/inspec-azure-check-profile .
    inspec exec inspec-azure-check-profile/ -t azure:// --chef-license accept-silent
fi

echo "azure_compliance-action execution completed"