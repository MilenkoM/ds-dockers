# ds-dockers
Useful dockers for DataScience

# Some scripts

## build.sh
Builds dockers in the repository for cpu/gpu usage
```
./build.sh -bs
# -b : base docker with Theano/TensorFlow and jupyter (base:{cpu,gpu})
# -s : data science docker with all you need (sci:{cpu,gpu})
```

## push.sh
Pushes dockers to remote repository
```
./push.sh -bs -r repository
# -b : base docker
# -s : data science docker with all you need
# -r repo : used as following `docker push $REPO/base:gpu && docker push $REPO/base:cpu`, ferres repo by default
```

## nvidia-tools.sh
Configures aws for gpu docker, needs to be excecuted on aws instance. Then you can use `nvidia-docker`
```
./nvidia-tools.sh
```
