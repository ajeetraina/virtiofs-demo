# virtiofs-demo

This repository compares the performance of filesystem with or without VirtioFS enabled.


## Tested Environment

- Docker Desktop for Mac
- Mac M1 Pro

## Results:


| S.No. | Data size | Time Taken(with VirtioFS enabled | Time Taken(without VirtioFS enabled |
|--------| ----------|---------|-----------|
|  1    |    1 GB    |  0.61s | 0.83s  |
|  2    |    10 GB   |  5.66s | 8.17s  | 



## Getting Started

## Enable VirtioFS

By default, VirtioFS is enabled in the latest version of Docker Desktop. You can verify it using:

<img width="1169" alt="image" src="https://github.com/ajeetraina/virtiofs-demo/assets/313480/e61afcd2-bc37-44de-a6dd-284aab09dcb6">

## Step 1. Create a directory

```
 mkdir data
```

## Step 2.  Create a file in the directory that contains a large amount of data(1GB random data)

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


```
time docker cp laughing_montalcini:/data/data.img data/data.img
Successfully copied 1.05GB to /Users/ajeetsraina/july/virt/data/data.img
docker cp laughing_montalcini:/data/data.img data/data.img  0.83s user 2.95s system 35% cpu 10.646 total
```


Yes, I can see that the time it takes to copy the file with VirtioFS enabled is significantly faster than the time it takes to copy the file without VirtioFS enabled. This is because VirtioFS is a more efficient filesystem than traditional filesystems.

The time it takes to copy a file between a container and the host machine can vary depending on a number of factors, including the size of the file, the network speed, and the filesystem that is being used. In your case, the time it took to copy the file with VirtioFS enabled was 0.61 seconds. This is significantly faster than the time it took to copy the file without VirtioFS enabled (1.84 seconds). This is because VirtioFS is a more efficient filesystem than traditional filesystems.

The difference in performance between VirtioFS and traditional filesystems can be even more pronounced when copying large files. For example, if you were to copy a 10GB file, the time it would take to copy the file with VirtioFS enabled would be significantly less than the time it would take to copy the file without VirtioFS enabled.

## Testing with 10GB data

## Without VirtioFS Enabled

<img width="1169" alt="image" src="https://github.com/ajeetraina/virtiofs-demo/assets/313480/d336bfec-c96e-4e17-9d95-e5c98426171c">


```
 time docker cp compassionate_bartik:/data/data.img data/data.img
Successfully copied 10.5GB to /Users/ajeetsraina/july/virt/data/data.img
docker cp compassionate_bartik:/data/data.img data/data.img  8.17s user 31.14s system 35% cpu 1:51.41 total
```

## With VirtioFS Enabled

```
 time docker cp gracious_chebyshev:/data/data.img data/data.img
Successfully copied 10.5GB to /Users/ajeetsraina/july/virt/data/data.img
docker cp gracious_chebyshev:/data/data.img data/data.img  5.66s user 17.99s system 34% cpu 1:07.64 total
```


