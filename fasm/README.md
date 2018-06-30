# fasm-docker
Docker container to build FASM code. It will always use the latest FASM version available.

You can find it at Docker Hub too: https://hub.docker.com/r/guitmz/fasm/

# Usage
`docker run -it --rm  -v $(pwd):/usr/src/myapp -w /usr/src/myapp guitmz/fasm fasm hello.asm`