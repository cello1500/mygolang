# mygolang

This creates a customized container for GO development. It is built on top of the official golang container.

How to use:
  1) Build the container: docker-compose build
  2) Execute start the container: ./mygolang
  3) Once in the container for the first time, run the script: /root/runme
     This will finish the VIM configuration
     
   ./mygolang can be called multiple times to start the container. It will create the container the first time it runs and will start if it already exists.
