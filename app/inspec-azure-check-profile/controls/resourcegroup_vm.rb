
control "azure-virtual-machines-check" do                                # A unique ID for this control.   
   
    describe azure_resource_groups do
      it { should exist }
    end

    describe azure_virtual_machine(resource_group: 'rg-main', name: 'testmachine') do
        it { should exist }  # have_only_approved_extensions(['ApprovedExtension', 'OtherApprovedExtensions']) }
    end
    
  end
  
