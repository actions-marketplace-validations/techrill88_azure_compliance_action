# you add controls here
control "azure-webapp-check" do                                # A unique ID for this control.
  impact 1.0                                                                   
  title "Check resource groups to see if any VMs exist."                       
  azure_resource_groups.names.each do |resource_group_name|                  
    describe azurerm_virtual_machines(resource_group: resource_group_name) do
      it { should exist } 
    end
  end
end

