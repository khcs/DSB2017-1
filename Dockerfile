FROM nvidia/cuda:9.0-base-ubuntu16.04

LABEL maintainer="Hoo Chang Shin <hshin@nvidia.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cuda-command-line-tools-9-0 \
        cuda-cublas-dev-9-0 \
        cuda-cudart-dev-9-0 \
        cuda-cufft-dev-9-0 \
        cuda-curand-dev-9-0 \
        cuda-cusolver-dev-9-0 \
        cuda-cusparse-dev-9-0 \
        curl \
        git \
        libcudnn7=7.0.5.15-1+cuda9.0 \
        libcudnn7-dev=7.0.5.15-1+cuda9.0 \
        libcurl3-dev \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        rsync \
        software-properties-common \
        unzip \
        zip \
	bzip2 \
 	ca-certificates \
        zlib1g-dev \
        wget \
        p7zip-full \
        vim \
	libgl1-mesa-glx \
	&& \
    rm -rf /var/lib/apt/lists/* && \
    find /usr/local/cuda-9.0/lib64/ -type f -name 'lib*_static.a' -not -name 'libcudart_static.a' -delete && \
    rm /usr/lib/x86_64-linux-gnu/libcudnn_static_v7.a

# All users can use /home/user as their home directory
ENV HOME=/home
RUN chmod 777 /home

# Install Anaconda
RUN curl -so ~/anaconda.sh https://repo.continuum.io/archive/Anaconda2-5.1.0-Linux-x86_64.sh \
 && chmod +x ~/anaconda.sh \
 && ~/anaconda.sh -b -p ~/anaconda \
 && rm ~/anaconda.sh
ENV PATH=/home/anaconda/bin:$PATH

RUN conda install pytorch torchvision cuda90 -c pytorch

RUN pip install h5py SimpleITK nvidia-ml-py pyparsing scipy pandas scikit-image dicom
RUN pip install -Iv numpy==1.11.3

# matplotlib config (used by benchmark)
RUN mkdir -p /root/.config/matplotlib
RUN echo "backend : Agg" > /root/.config/matplotlib/matplotlibrc

