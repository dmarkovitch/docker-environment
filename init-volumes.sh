#!/bin/bash

# Data Volume Initialization script

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --medp|--mongoExternalDataPath)
    VOLUME_PATH="$2"
    shift
    shift
    ;;
esac
done

# MONGODB
volume_name=mongo_data
volumeOutput=$(docker volume inspect --format '{{.Name}}' $volume_name)

if [ ! -z $volumeOutput ]
then
    echo "$volume_name volume ready to go"
else
    echo "create $volume_name volume..."

    docker volume create $volume_name

    if [ ${VOLUME_PATH} ]
    then
        echo "populate $volume_name volume..."

        docker container create --name dummy -v $volume_name:/data/db hello-world

        docker cp ${VOLUME_PATH}. dummy:/data/db

        docker rm dummy
        docker rmi hello-world
    fi

    echo "volume $volume_name created and ready to go"
fi

# MSSQL
volume_name=mssql_data
volumeOutput=$(docker volume inspect --format '{{.Name}}' $volume_name)

if [ ! -z $volumeOutput ]
then
    echo "$volume_name volume ready to go"
else
    echo "create $volume_name volume..."

    docker volume create $volume_name

    echo "volume $volume_name created and ready to go"
fi

# REDIS
volume_name=redis_data
volumeOutput=$(docker volume inspect --format '{{.Name}}' $volume_name)

if [ ! -z $volumeOutput ]
then
    echo "$volume_name volume ready to go"
else
    echo "create $volume_name volume..."

    docker volume create $volume_name

    echo "volume $volume_name created and ready to go"
fi

# RABBITMQ
volume_name=rabbit_data
volumeOutput=$(docker volume inspect --format '{{.Name}}' $volume_name)

if [ ! -z $volumeOutput ]
then
    echo "$volume_name volume ready to go"
else
    echo "create $volume_name volume..."

    docker volume create $volume_name

    echo "volume $volume_name created and ready to go"
fi

# SEQ
volume_name=seq_data
volumeOutput=$(docker volume inspect --format '{{.Name}}' $volume_name)

if [ ! -z $volumeOutput ]
then
    echo "$volume_name volume ready to go"
else
    echo "create $volume_name volume..."

    docker volume create $volume_name

    echo "volume $volume_name created and ready to go"
fi