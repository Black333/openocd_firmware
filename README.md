# OpenOCD Firmware

Работа с устройствами через OpenOCD.

#### **-t [Target name]**
Название устройства например *stm32f0x, stm32f1x, stm32h7x, ...*

#### **-i [Interface name]**
Название интерфейса например *jlink, stlink, ...*

Можно запустить без аргументов **-t [Target name]** или **-i [Interface name]**
```
$ ./reset.sh
```
```
$ ./reset.sh -t [Target name]
```
```
$ ./reset.sh -i [Interface name]
```
Тогда параметры будут браться из файла **config.sh**
Соответственно можно заменить на что нибудь другое.

## reset

Перезапуск устройства.
```
$ ./reset.sh -t [Target name] -i [Interface name]
```
Подробнее см. [Command: reset](http://openocd.org/doc/html/General-Commands.html)

## unlock

Разблокировка устройства. Эта команда приведет к полной очистке всего устройства, если оно было заблокировано ранее.
```
$ ./unlock.sh -t [Target name] -i [Interface name]
```
Подробнее см. [Command: "Target name" unlock num](http://openocd.org/doc/html/Flash-Commands.html)

## write_image

Записывает бинарный файл во флэш память.
Аргумент **-f [File name]** обязателен.
```
$ ./write_image.sh -t [Target name] -i [Interface name] -f [File name]
```
```
$ ./write_image.sh -f STM32H743ZI-Nucleo.bin
```
Подробнее см. [Command: flash write_image [erase] [unlock] filename [offset] [type]](http://openocd.org/doc/html/Flash-Commands.html)

## flash_erase

Полная очистка устройста.
```
$ ./flash_erase.sh -t [Target name] -i [Interface name]
```
Подробнее см. [Command: "Target name" mass_erase num](http://openocd.org/doc/html/Flash-Commands.html)