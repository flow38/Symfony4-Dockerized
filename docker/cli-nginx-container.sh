. ./.env

#Windows Mintty mode (http://willi.am/blog/2016/08/08/docker-for-windows-interactive-sessions-in-mintty-git-bash/)
#winpty  docker exec -ti ${NGINX_CONTAINER} bash 


#Linux/Mac
docker exec -ti ${NGINX_CONTAINER} bash
