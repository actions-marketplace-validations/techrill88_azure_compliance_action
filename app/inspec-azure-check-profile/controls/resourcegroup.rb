
control "azure-virtual-machines-exist-check" do                                # A unique ID for this control.   
    title "Check resource groups to see if any VMs exist."                      
    azure_resource_groups.names.each do |resource_group_name|   
      put "RG name #{resource_group_name}"            
      describe azurerm_virtual_machines(resource_group: resource_group_name) do
        it { should exist } # The test itself.
      end
    end

    describe azure_resource_groups do
      it { should exist }
    end

    describe azure_virtual_machine(resource_group: 'rg-core', name: 'workvm') do
        it { should have_only_approved_extensions(['ApprovedExtension', 'OtherApprovedExtensions']) }
    end
    
  end
  
