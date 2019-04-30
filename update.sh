#!/bin/bash
helm package ./stable/$1 
mv -f *.tgz repo/stable
helm repo index --url https://ibm-icp-coc.github.io/charts/repo/stable/ ./repo/stable/
