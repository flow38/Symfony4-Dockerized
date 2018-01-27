. ./.env

#Windows Mintty mode (http://willi.am/blog/2016/08/08/docker-for-windows-interactive-sessions-in-mintty-git-bash/)
#winpty  docker exec -ti ${PHP_FPM_CONTAINER} bash


#Windows default console mode 
docker exec -ti ${PHP_FPM_CONTAINER} bash
