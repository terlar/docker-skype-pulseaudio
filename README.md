# Dockerized Skype

Run Skype inside an isolated [Docker](http://www.docker.io) container. This is achieved by sharing a socket for X11 and PulseAudio.

## Instructions

1. Clone this repository and change to the directory:

  ```sh
  git clone https://github.com/terlar/docker-skype-pulseaudio.git && cd docker-skype-pulseaudio
  ```

2. Build the container:

  ```sh
  sudo docker build -t skype .
  ```

3. Run the provided skype script:

  ```sh
  scripts/skype
  ```

4. Use Skype.
