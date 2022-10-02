
Read this in other languages: [English](https://github.com/reyvonger/rikani_radio/blob/master/international/english.md)
# Что это?
Это гайд и скрипты для запуска аналога lofi radio на своём сервере, которое будет работать независимо от вашего компьютера :)

# Руководство по настройке youtube-радио
Это не оригинальная разработка, а компиляция из других проектов, ссылки на них внизу

⚡️⚡️⚡️

Обратите внимание: изменились пути хранения треков и видео

/root/video > /root/radio_runtime

/root/music > /root/radio_runtime/music

переместите файлы, если у вас сломалось

⚡️⚡️⚡️
## Помощь

Если у вас возникли проблемы - можете задать вопросы в [telegram](https://t.me/rikaniburg) или [discord](https://discord.com/invite/4CKq3JB) каналах [rikani](https://rikani.ru)

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
add-apt-repository ppa:ansible/ansible --yes; apt update; apt install -y git ansible
```

И скачиваем скрипты для настройки
```
cd; git clone https://github.com/reyvonger/rikani_radio.git
mkdir -p /root/radio_runtime/music
```

Теперь нам необходимо загрузить на сервер видео и аудио файлы, для этого используем [WinSCP](https://winscp.net/eng/download.php)

Подключаемся к серверу, протокол передачи указываем **SCP**, имя хоста это адрес сервера, пользователь и пароль вам должен дать хостинг

![screen03](https://rikani.ru/files/scp01.png)

* Видео должно называться **video.mp4** (изменить можно через аргументы) и лежать в папке /root/radio_runtime/
* Музыка должна быть в формате **mp3** и не должна начинаться на спецсимволы вроде:  % - " @ и подобных
* Треки должны лежать /root/radio_runtime/music/


![screen04](https://rikani.ru/files/scp02.png)

После загрузки ролика и треков возвращаемся к [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) и вбиваем следующую команду, Необходимо поменять YT_TOKEN на свой токен из личного кабинета [youtube](https://studio.youtube.com) и user поменять на имя пользователя, которое вам дал ваш хостинг

![screen05](https://rikani.ru/files/token.png)

```
cd ~/rikani_radio && ansible-playbook -i inventory.ini main.yaml -e user=ubuntu -e YT_TOKEN=e3gu-424p-fzj4-zha0-2v2b 
```
* YT_TOKEN= - эту часть нужно **оставить**, это не токен, токен идёт после символа **равно**
* Перед выполнением этой команды необходимо выполнить **sudo su**
* После выполнения этой команды начнётся стрим на вашем youtube аккаунте, если хотите добавить треки или поменять видео - просто поменяйте их и запустите последнюю команду снова. 
* Поcле выполения скрипта музыка перезапускается


## Настройка
С помощью опции **-e key=value** можно изменять некоторые настройки.
Ниже примеры значений по умолчанию:

* -e user=root - если ваш юзер не **root**, иногда хостер может дать логин **ubuntu**
* -e VBR=10000k - битрейт
* -e FPS=25 - кадры в секунду
* -e QUAL=veryfast - качесво потока (поддерживается ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow)
* -e crf=25 - от 0 до 51, диапазон сжатия где 51 наихудшее качество, а 0 без потерь. 25 оптимальное значение. подробнее [в документации ffmpeg](https://trac.ffmpeg.org/wiki/Encode/H.264)
* -e track_output=true - вывод названия трека на экран
* -e fontcolor=white - цвет шрифта для вывода трека
* -e fontsize=24 - размер шрифта
* -e boxcolor=black@0.5 - цвет рамки с названием трека
* -e boxborderw=5 - размер рамки с названием трека
* -e x=0 - положение блока с названием трека по оси X
* -e y=0 - положение блока с названием трека по оси Y
* -e youtube_protocol=rtmp - протокол стриминга на ютуб, поддерживаемые значения - rtmp, hls. рекомендуется использовать hls.


## Используемые проекты

* [docker-music-stack](https://github.com/VITIMan/docker-music-stack/) - Victoriano Navarro
* [docker-ffmpeg](https://github.com/jrottenberg/ffmpeg) - Julien Rottenberg


## Авторы

* **Sonya RIKANI** - *Идея* - [rikani.ru](https://rikani.ru)
* **Vladimir Pankin** - *Реализация* - [pankin.org](https://pankin.org)

