---
title: "Справочник комманд Windows"
description: "Справочник по коммандам в терминале Windows"
slug: windows-cheatsheet
summary: "Мы используем блог для анонса статей или служебных заметок. Информация в них может быть не актуальной или даже не верной! Актуальную информацию смотрите в соответствующих разделах."
date: 2025-06-21T00:00:01+03:00
lastmod: 2025-09-05T00:00:02+03:00
draft: false
tags: ["it", "windows"]
categories: ["Заметки"]
series: ["Настройка программ"]
# weight: 1
# aliases: ["/first"] # старая ссылка с которой нужно сделать редирект
author: "Mitulka"
# author: ["Mitulka", "Veroncher"] # multiple authors
showToc: true
TocOpen: true
hidemeta: false
comments: false
# canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
hideSummary: false
searchHidden: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
  image: "/posts/windows-cheatsheet/img/cover-windows-cheatsheet-svgo.svg" # путь к обложке поста
  alt: "Hello, World!" # alt text
  caption: "Настройка Hello, World!" # display caption under cover
  relative: true # when using page bundles set this to true
  hidden: false # only hide on current single page
editPost:
    URL: "https://github.com/<path_to_repo>/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---

## Инициализация удаленного репозитория Git

```
git remote add hoster ssh://gorshoch@gorshochek.by/home/gorshoch/public_html/lyasne.by
git push -u hoster main
```

## Как запустить «Планировщик задач» и сделать автозагрузку приложения

- Нажимаем кнопку *«Пуск»* вводим **«Планировщик заданий»**, после его появления нажимаем на него.
- Вызываем окно *«Выполнить»* нажав **Win+R** и вводим в нем команду ```taskschd.msc```
- Нажимаем правой кнопкой мыши на кнопку *«Пуск»* и в выпадающем меню выбираем **«Управление компьютером»**. Щелкаем по узлу **«Служебные программы»** и там находим **«Планировщик заданий»**.

![Планировщик заданий](img/01-windows-cheatsheet.png)

### Три простых шага для автозапуска приложения:

  - Шаг 1 Создаем новую задачу

    ![Автозапуск приложения](img/04-windows-cheatsheet.jpg)

  - Шаг 2 Добавляем триггер запуска

    ![Автозапуск приложения](img/05-windows-cheatsheet.jpg)

  - Шаг 3 Указываем действие для задачи

    ![Автозапуск приложения](img/06-windows-cheatsheet.jpg)

## Проверка и восстановление системных файлов
Следующий возможный метод решения проблемы — восстановление системных файлов Windows.

### Необходимые шаги:

- Запустите командную строку от имени администратора: если это не получается сделать стандартными методами, откройте диспетчер задач, нажмите «Запустить новую задачу», введите cmd и отметьте опцию запуска от имени администратора.
- По порядку введите следующие две команды:

```
DISM /Online /Cleanup-Image /RestoreHealth
```

```
sfc /scannow
```

Исправление ошибок системных файлов Windows

![Планировщик заданий](img/02-windows-cheatsheet.png)

Если в результате вы получили информацию о том, что повреждения были обнаружены и исправлены, перезагрузите компьютер и проверьте, решило ли это проблему.

> Учитывайте, что выполнение первой из команд может занять продолжительное время и «зависать» в процессе, дождитесь завершения.

## Total Commander

### Настройка стрелок как PageUp/PageDown

- Открыть файл конфигурации: `Конфигурация \ Редактировать файлы конфигурации`
- Открывается 2 файла: `wincmd.ini`, `wcx_ftp.ini`
- В `wincmd.ini` после `[Configuration]` добавить:

```html
  SpecialCursorMovement=9
```

- Перезапустить Total Commander

## Far Manager

### Настройка плагина EditWrap — виртуальный перенос строк в редакторе

- [Скачать](https://plugring.farmanager.com/plugin.php?pid=951&l=ru) и установить плагин EditWrap

- Открыть папку с установленным плагином. Стандартный путь установки: C:\Program Files\Far Manager\Plugins\EditWrap.1.9\ найти и открыть файл KeyBar.farconfig

- Сохранить его как: Thumbnails_KeyBar.xml

- Выполнить команду

```
"%FARHOME%\Far.exe" /import Thumbnails_KeyBar.xml
```

- Это добавит кнопку VWWrap при нажатии на Shift:

![Подпись кнопки WWrap](img/03-windows-cheatsheet.gif)

- Запишите макрос для запуска команды Toggle word wrap плагина WordWrap согласно [официальной документации](https://api.farmanager.com/ru/macro/macrokey/record.html)

> Теперь при нажатии на <kbd>Shift</kbd> + <kbd>F3</kbd> будет осуществлятся перенос виртуальных строк на экране в редакторе FAR