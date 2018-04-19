nvidia-docker run -v /datasets/dsb/unzipped:/datasets -v /tmp/DSB2017-1:/home/DSB2017-1 -it --ipc=host -p 8888:8888 nvcr.io/nvidian/sae/ct_lung_nodule /bin/bash
