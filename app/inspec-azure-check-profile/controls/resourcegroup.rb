control 'azure_resource_groups' do
    describe azure_resource_groups do
        its('names')  { should include 'rg-core' }
    end
end

control 'azure-rg-exists' do
    describe azure_resource_groups do
        it { should exist }
    end
emd