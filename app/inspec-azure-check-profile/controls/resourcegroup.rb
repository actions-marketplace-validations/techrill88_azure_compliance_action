control 'azure_resource_groups' do
    describe azure_resource_groups do
        its('names')  { should include 'rg-core' }
    end
end