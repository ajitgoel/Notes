creating parameters to use in CloudFormation template
https://code.amazon.com/packages/PharmacyLandingVpcInfrastructure/blobs/mainline/--/configuration/jinja/DramService.template.yml.jinja#L3-L5
Conditions:
  IsGammaStage: !Equals [!Ref Stage, "gamma"]
  IsProductionStage: !Equals [!Ref Stage, "prod"]
  