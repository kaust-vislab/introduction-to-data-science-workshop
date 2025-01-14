#!/bin/bash

# Step 1: Download python-novice-inflammation-data.zip and python-novice-inflammation-code.zip
curl -o python-novice-inflammation-data.zip https://swcarpentry.github.io/python-novice-inflammation/data/python-novice-inflammation-data.zip
curl -o python-novice-inflammation-code.zip https://swcarpentry.github.io/python-novice-inflammation/files/code/python-novice-inflammation-code.zip
curl -o python-novice-gapminder-data.zip https://swcarpentry.github.io/python-novice-gapminder/files/python-novice-gapminder-data.zip
# Step 2: Create a folder called swc-python on your Desktop
mkdir -p swc-python

# Step 3: Move downloaded files to swc-python
mv python-novice-inflammation-data.zip swc-python/
mv python-novice-inflammation-code.zip swc-python/
mv python-novice-gapminder-data.zip swc-python/

# Step 4: Unzip the files
cd swc-python
unzip python-novice-inflammation-data.zip
unzip python-novice-inflammation-code.zip
unzip python-novice-gapminder-data.zip

# Optional: Clean up the zip files if needed
rm python-novice-inflammation-data.zip
rm python-novice-inflammation-code.zip
rm python-novice-gapminder-data.zip