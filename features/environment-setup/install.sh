#!/bin/bash

USER=vscode

CSHARP=true

if [[ "$CSHARP"x == "true"x ]]; then

# Update the dotnet workloads (includes aspire)
dotnet workload update

# Trust the developer certificate
su $USER -c "dotnet dev-certs https --trust"

fi

# # Install dotnet tooling
# dotnet tool install --global dotnet-outdated-tool
# dotnet tool install --global dotnet-ef

# # Install support for Sql projects
# dotnet tool install --global Microsoft.SqlPackage

