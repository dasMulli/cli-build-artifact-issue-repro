#!/bin/bash

srcdir="$(dirname ${BASH_SOURCE[0]})"
dotnet="${srcdir}/dotnet/dotnet"
projdir="${srcdir}/TestApp"

echo "Using dotnet from $dotnet (version: $($dotnet --version))"

echo "dotnet --info output:"
$dotnet --info

echo "Beginning repro"

$dotnet restore $projdir
$dotnet publish $projdir -c Release -r osx.10.11-x64
$dotnet publish $projdir -c Release -r win7-x64