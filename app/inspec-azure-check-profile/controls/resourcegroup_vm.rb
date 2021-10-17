
control "azure-vm-sample" do                                # A unique ID for this control.   
   
    describe azure_resource_groups do
      it { should exist }
    end
  end
  
