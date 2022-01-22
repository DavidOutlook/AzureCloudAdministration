# Log into Azure account through Visual Studio Code or Windows Terminal.  Or skip using cloudshell.
Connect-AzAccount # Provide Credentials

# Create ResourceGroup.  Both -Name and -Location are positional parameter's (optional)
# https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-powershell
New-AzResourceGroup -Name Deploy -Location eastus   # to delete, Remove-AzResourceGroup

# Use -TemplateFile for local template, -TemplateUri for Remote from GitHub (RAW link)
# https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-tutorial-local-template?tabs=azure-powershell 
# optional, use variables.  ex $templateFile = "path" or $rg = "ResourceGroupName"
New-AzResourceGroupDeployment `
    -Name "DeployTemplate" `
    -ResourceGroupName "Deploy" `
    -TemplateFile C:\GitHub\MSSAProject\vnet1.json `
    -verbose

#-TemplateUri https://raw.githubusercontent.com/DavidOutlook/MSSA-Project/main/Tier2/Tier2Vnet.json

    # Vnet template works.  Custom will not be same as Portal generated template (ex. longer and location is hard-coded w/o a function)

# load balancer, not yet.  Depends on - ONLY references whats in Template.  
# Can delete DependsOn, and won't break template, just put lower in template.  May have to run template twice to work.