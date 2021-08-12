#/bin/bash
docker run -it --mount type=bind,source="$(pwd)",target=/home/user/mnt z3:100 bash -c "cd mnt;/usr/bin/z3 $@"
