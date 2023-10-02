#!/bin/bash
#Written by HyenaTown
#A quick check for necessary tools to build Ultimate Doom Builder. 

echo "This'll just take a second..."
KERNEL_V=$(uname -sri)
MONO_V=$(mono --version | grep version)
MSBUILD_V=$(msbuild --version | grep version)
GPP_V=$(g++ --version | grep g++)
MONO_LOC=$(which mono)
MSBUILD_LOC=$(which msbuild)
GPP_LOC=$(which g++)
UDB_LOC=$(find $HOME -wholename *UltimateDoomBuilder/Build/Builder.exe)
echo "Done."
echo $KERNEL_V
echo $MONO_V
echo $MONO_LOC
echo $MSBUILD_V
echo $MSBUILD_LOC
echo $GPP_V
echo $GPP_LOC
echo "Ultimate Doom Builder: $UDB_LOC"
