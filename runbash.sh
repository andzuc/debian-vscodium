#!/bin/bash
export LIBGL_ALWAYS_INDIRECT=1
export LIBGL_ALWAYS_SOFTWARE=0
export MESA_GL_VERSION_OVERRIDE=3.0
PROFILEDIR="${HOME}/dev/vscodium"

if [ -d "${PROFILEDIR}" ] ; then
    docker run -it \
	   --privileged \
	   --name vscodium \
	   --rm \
	   --net=host \
	   --env="DISPLAY" \
	   --mount "type=bind,src=${HOME}/.Xauthority,dst=/home/vscodium/.Xauthority,readonly" \
 	   --mount "type=bind,src=${PROFILEDIR},dst=/home/vscodium" \
	   --entrypoint /bin/bash \
	   andzuc/debian-vscodium:latest
else
    echo "Profile not found: ${PROFILE}"
fi
