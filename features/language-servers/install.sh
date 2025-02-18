#!/bin/bash

USER=vscode

# Install dotnet tooling
dotnet tool install --global dotnet-outdated-tool
dotnet tool install --global dotnet-ef

# Install support for Sql projects
dotnet tool install --global Microsoft.SqlPackage

# Update the dotnet workloads (includes aspire)
sudo dotnet workload update

dotnet workload update

su $USER -c "dotnet dev-certs https --trust"
