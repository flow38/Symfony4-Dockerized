#Remove dangling images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
#Remove dangling volumes
docker volume rm $(docker volume ls -qf dangling=true)