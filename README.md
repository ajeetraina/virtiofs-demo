# virtiofs-demo
Demonstrate the VirtioFS functionality under Docker Desktop


## Getting Started

## Step 1. Create a directory

```
 mkdir data
```

## Step 2.  Create a file in the directory that contains a large amount of data

```
 dd if=/dev/zero of=data/data.img bs=1M count=1000
```


## Step 3. Build the Image

Clone the repository

```
 docker build -t ajeetraina/virtiofs-demo:latest
```

## Step 4.  Run the Docker container

```
 docker run -it --rm -v "$(pwd)/data:/data" ajeetraina/virtiofs-demo
```

## Step 5. List the container

```
  docker ps
  CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS     NAMES
  e47eb4731c80   ajeetraina/virtiofs-demo   "bash"                   5 minutes ago   Up 5 minutes             gifted_lichterman
```

## Step 6. Measure the time it takes to copy the file into the container


```
 time docker cp gifted_lichterman:/data/data.img data/data.img
```

## Results:

```
  Successfully copied 1.05GB to /Users/ajeetsraina/july/virt/data/data.img
  docker cp gifted_lichterman:/data/data.img data/data.img  0.61s user 1.84s system 36% cpu 6.750 total
```

## Step 7. Repeat steps 5 and 6 without VirtioFS




