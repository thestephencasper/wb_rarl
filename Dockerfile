FROM tensorflow/tensorflow:1.15.0-gpu-py3
FROM python:3.6.8
# FROM nvidia/cuda:10.0-base
# CMD nvidia-smi

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir wb_rarl
WORKDIR /wb_rarl

RUN apt-get update && \
	apt-get install -y libosmesa6-dev libgl1-mesa-glx libglfw3 && \
	apt-get update
RUN pip install --upgrade pip
RUN pip install numpy==1.17.1 gym==0.14.0 lz4==2.2.1 requests==2.22.0 \
matplotlib opencv-python==4.1.0.25 gym==0.14.0 awscli==1.16.259 pytest==5.2.1 \
ray[tune] ray[rllib] ray==0.8.0 mujoco-py patchelf scipy psutil
RUN pip install tensorflow-gpu==1.15.0
RUN pip install --pre pytz
RUN pip install --upgrade Pillow
