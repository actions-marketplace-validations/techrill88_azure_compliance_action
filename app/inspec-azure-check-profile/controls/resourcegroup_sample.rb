
control "azure-rg-exists-sample" do                                # A unique ID for this control.   
   
    describe azure_resource_groups do
      it { should exist }
    end
  end
  
