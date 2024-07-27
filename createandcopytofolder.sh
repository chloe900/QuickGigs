#!/bin/bash
[[ -d artifacts ]] && rm -r artifacts
mkdir artifacts
cp -R web artifacts
