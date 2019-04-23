# Cписок образов
docker images

# Загрузка образа
docker pull mcr.microsoft.com/businesscentral/onprem:ru

# Удаление образа
docker rmi mcr.microsoft.com/businesscentral/onprem:ru

# Список контейнеров:
docker ps

# Список запущенных контейнеров:
docker ps -a

# Создание нового контейнера
docker run -e accept_eula=Y -m 4G `
	--name bc-ru `
	--hostname bc-ru `
	mcr.microsoft.com/businesscentral/onprem

# Старт существующего контейнера
docker start bc-ru

# Остановка запущенного контейнера
docker stop bc-ru

# Удаление контейнера
docker rm bc-ru

# 
Get-NavContainers bc-ru
Open-NavContainer bc-ru