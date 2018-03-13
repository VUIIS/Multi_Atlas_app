# Multi_Atlas_app
This includes everything required (except for the "full-multi-atlas" directory) to build a docker and corresponding singularity container for the Multi Atlas pipeline. 

[Docker Hub](https://hub.docker.com/r/vuiiscci/multi_atlas/tags/)

[Singularity Hub](https://singularity-hub.org/collections/734)

# Build Instructions:
Just clone and run `build.sh`:
```
git clone https://github.com/vuiiscci/Multi_Atlas_app.git
cd Multi_Atlas_app/
./build.sh
```
NOTE that you must have full-multi-atlas directory which contains atlases.

# Run Instructions:
For docker:
```
sudo docker run --rm \
--runtime=nvidia \
-v $(pwd)/INPUTS/:/INPUTS/ \
-v $(pwd)/OUTPUTS:/OUTPUTS/ \
--user $(id -u):$(id -g) \
vuiiscci/Multi_Atlas
```
For singularity:
```
singularity run -e \
--nv \
-B INPUTS/:/INPUTS \
-B OUTPUTS/:/OUTPUTS \
shub://vuiiscci/Multi_Atlas_app
```
