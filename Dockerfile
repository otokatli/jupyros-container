FROM ros:noetic-ros-base

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
    curl \
    python3-pip \
    python3-dev \
    nodejs \
	python3-setuptools \
	python3-venv \
	python3-wheel

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Install ROS dependencies for building packages
#RUN apt-get update && \
#    apt-get install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential && \
#    rm /etc/ros/rosdep/sources.list.d/20-default.list && \
#    rosdep init && rosdep update

#########RUN python3 -m pip install jupyterlab bqplot pyyaml numpy ipywidgets \
#########    widgetsnbextension jupyros && \
#########    jupyter nbextension enable --py ipywidgets && \
#########    jupyter nbextension enable --py widgetsnbextension && \
#########    jupyter nbextension enable --py jupyros


RUN python3 -m pip install jupyterlab bqplot pyyaml numpy ipywidgets jupyros && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter nbextension enable --py jupyros

#RUN python3 -m pip install jupyros && \
#    jupyter nbextension enable --py jupyros

#COPY ./entrypoint.sh /

#ENTRYPOINT ["/entrypoint.sh"]

#EXPOSE 8888
