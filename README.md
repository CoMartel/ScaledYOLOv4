# YOLOv4-CSP

This is the implementation of "[Scaled-YOLOv4: Scaling Cross Stage Partial Network](https://arxiv.org/abs/2011.08036)" using PyTorch framwork.

* **2020.11.16** Now supported by [Darknet](https://github.com/AlexeyAB/darknet). [`yolov4-csp.cfg`](https://github.com/AlexeyAB/darknet/blob/master/cfg/yolov4-csp.cfg) [`yolov4-csp.weights`](https://drive.google.com/file/d/1NQwz47cW0NUgy7L3_xOKaNEfLoQuq3EL/view?usp=sharing)

## Installation & usage

```
# create the docker container, you can change the share memory size if you have more.
docker build -t scaledyolov4 .

# create shared folder
cd ~
mkdir shared_volume
cd shared_volume/

# download a test video
pip install youtube-dl
youtube-dl https://www.youtube.com/watch?v=h4s0llOpKrU -o video.mp4

# run docker container
nvidia-docker run --rm --name yolov4_csp -it -v ~/shared_volume/:/shared/ --shm-size=64g scaledyolov4

# run detection on the video
python detect.py --source ../shared/video.mp4 --cfg models/yolov4-csp.cfg --weights weights/yolov4-csp.weights --conf-thres 0.5 --classes 0 --output ../shared/output

Output file is saved in shared_volume/output
```


## Citation

```
@article{wang2020scaled,
  title={{Scaled-YOLOv4}: Scaling Cross Stage Partial Network},
  author={Wang, Chien-Yao and Bochkovskiy, Alexey and Liao, Hong-Yuan Mark},
  journal={arXiv preprint arXiv:2011.08036},
  year={2020}
}
```
