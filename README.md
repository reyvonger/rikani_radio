# Что это?
Это гайд и скрипты для запуска аналога lofi radio на своём сервере, которое будет работать независимо от вашего компьютера :)

# Руководство по настройке youtube-радио
Это не оригинальная разработка, а компиляция из других проектов, ссылки на них внизу

## Начало

Для установки требуется:

* VPS сервер с [Ubuntu](https://ubuntu.com/download) 20.04 (но должно работать и на других версиях)
* Консоль управления - [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) 
* Программа для передачи файлов - [WinSCP](https://winscp.net/eng/download.php)

### Подготовка
Скачиваем и устанавливаем - [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) и [WinSCP](https://winscp.net/eng/download.php)

Установка стандартная, прокликиваем "Далее, Далее" в мастере и всё готово.


После покупки VPS (сервера) на него нужно зайти и установить необходимые для работы программы, для этого запускаем putty и вбиваем адрес:

![screen01](https://rikani.ru/files/putty01.png)

Затем логин и пароль, **звездочки не отображаются**, это нормально, **ПАРОЛЬ ВВОДИТСЯ**

![screen01](https://rikani.ru/files/putty02.png)

Заходим под вашим пользователем, чаще всего это **ubuntu**, но может быть что-то другое, что даст вам хостинг.

Создаём папки, в которые потом будем класть видео и треки
```
mkdir ~/music; mkdir ~/video
```

Далее заходим под Администратором, для этого нужно выполнить команду ниже. Возможно потребуется вбить пароль ещё раз, звездочки снова не отображаются.
```
sudo su
```

Устанавливаем базовые программы для настройки
```
apt install -y git ansible
```

И скачиваем скрипты для настройки
```
cd ~ && git clone https://github.com/reyvonger/rikani_radio.git
```

Теперь нам необходимо загрузить на сервер видео и аудио файлы, для этого используем [WinSCP](https://winscp.net/eng/download.php)

Подключаемся к серверу, протокол передачи указываем **SCP**, имя хоста это адрес сервера, пользователь и пароль вам должен дать хостинг

![screen03](https://rikani.ru/files/scp01.png)

* Видео должно называться **video.mp4** и лежать в папке video. да, video.mp4 в папке video :)
* Музыка должна быть в формате **mp3** и не должна начинаться на спецсимволы вроде:  % - " @ и подобных
* Класть нужно в каталоге /home/%USERNAME%/ в папки music и video. USERNAME скорее всего будет - ubuntu (пример: /home/ubuntu/music), но оно может отличаться.


![screen04](https://rikani.ru/files/scp02.png)

После загрузки ролика и треков возвращаемся к [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) и вбиваем следующую команду, Необходимо поменять YT_TOKEN на свой токен из личного кабинета [youtube](https://studio.youtube.com) и user поменять на имя пользователя, которое вам дал ваш хостинг

![screen05](https://rikani.ru/files/token.png)

```
ansible-playbook -i ~/rikani_radio/inventory.ini ~/rikani_radio/main.yaml -e YT_TOKEN=e3gu-424p-fzj4-zha0-2v2b -e user=ubuntu
```

* Перед выполнением этой команды необходимо выполнить **sudo su**
* После выполнения этой команды начнётся стрим на вашем youtube аккаунте, если хотите добавить треки или поменять видео - просто поменяйте их и запустите последнюю команду снова. 
* Поcле выполения скрипта музыка перезапускается

## Используемые проекты

* [docker-music-stack](https://github.com/VITIMan/docker-music-stack/) - Victoriano Navarro
* [docker-ffmpeg](https://github.com/jrottenberg/ffmpeg) - Julien Rottenberg


## Авторы

* **Sonya RIKANI** - *Идея* - [rikani.ru](https://rikani.ru)
* **Vladimir Pankin** - *Реализация* - [pankin.org](https://pankin.org)

## Помощь

Если у вас возникли проблемы - можете задать вопросы в [telegram](https://t.me/joinchat/FYOaAF_8mp8pgDjf) или [discord](https://discord.com/invite/4CKq3JB) каналах [rikani](https://rikani.ru)
