control 'azure-rg-exists' do
    describe azure_resource_groups do
        it { should exist }
    end
end

control "azure-virtual-machines-exist-check" do                                # A unique ID for this control.   
    title "Check resource groups to see if any VMs exist."                       # A human-readable title
    azure_resource_groups.names.each do |resource_group_name|                  # Plural resources can be leveraged to loop across many resources
      describe azurerm_virtual_machines(resource_group: resource_group_name) do
        it { should exist } # The test itself.
      end
    end
  end
  