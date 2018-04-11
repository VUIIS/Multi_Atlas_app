#!/bin/bash
set -e 

# extra contains all code/data
cd extra

# Update git repos
GIT_REPOS="validate_docker_inputs"
for GIT_REPO in $GIT_REPOS;
do 
	if [ -d "$GIT_REPO" ]; then
       		echo git pulling $GIT_REPO
        	cd $GIT_REPO
        	git pull
        	cd ..
	else
		echo git cloning $GIT_REPO
        	git clone https://github.com/justinblaber/$GIT_REPO
	fi
done

# Build docker
cd ..
sudo docker build --rm -t vuiiscci/multi_atlas:latest .

# Push docker - note this only affects latest tag. Must retag and push if you want to give a specific tag
sudo docker push vuiiscci/multi_atlas:latest
