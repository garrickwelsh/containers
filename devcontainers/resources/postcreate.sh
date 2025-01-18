#!/bin/bash

USER=vscode

sudo su $USER -c ".devcontainer/postcreate_install.sh"
