FROM nvcr.io/nvidia/pytorch:20.06-py3

# install mish activations
RUN pip install git+https://github.com/JunnYu/mish-cuda/

COPY . /yolo

WORKDIR /yolo

RUN mkdir weights

# download weights
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1NQwz47cW0NUgy7L3_xOKaNEfLoQuq3EL' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1NQwz47cW0NUgy7L3_xOKaNEfLoQuq3EL" -O "./weights/yolov4-csp.weights" && rm -rf /tmp/cookies.txt


