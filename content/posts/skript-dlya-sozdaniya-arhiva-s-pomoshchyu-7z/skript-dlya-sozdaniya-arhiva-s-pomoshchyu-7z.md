---
title: "Скрипт для создания архива с помощью 7z"
description: "Скрипт написан с использованием синтаксиса командного файла Windows (Batch)"
slug: skript-dlya-sozdaniya-arhiva-s-pomoshchyu-7z
summary: "Мы используем блог для анонса статей или служебных заметок. Информация в них может быть не актуальной или даже не верной! Актуальную информацию смотрите в соответствующих разделах."
date: 2025-07-21T00:00:01+03:00
lastmod: 2025-07-21T00:00:02+03:00
draft: false
tags: ["it", "windows", "batch", "bat"]
categories: ["Заметки"]
series: ["Настройка программ"]
# weight: 1
# aliases: ["/first"] # старая ссылка с которой нужно сделать редирект
author: "Mitulka"
# author: ["Mitulka", "Veroncher"] # multiple authors
showToc: true
TocOpen: false
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
  image: "/posts/skript-dlya-sozdaniya-arhiva-s-pomoshchyu-7z/img/cover-skript-dlya-sozdaniya-arhiva-s-pomoshchyu-7z-svgo.svg" # путь к обложке поста
  alt: "Скрипт для создания архива с помощью 7z" # alt text
  caption: "Настройка скрипта для создания архива с помощью 7z" # display caption under cover
  relative: true # when using page bundles set this to true
  hidden: false # only hide on current single page
editPost:
    URL: "https://github.com/<path_to_repo>/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---

# Скрипт для создания архива с помощью 7z

```
@echo off
set source="D:\Mitulka\www\pyatok-net\pyatok-net-src"
set destination="D:\OneDrive"

:: Получение даты
set dd=%DATE:~0,2%
set mm=%DATE:~3,2%
set yyyy=%DATE:~6,4%

:: Получение времени с обработкой пробела в часах
set hour=%TIME:~0,2%
if "%hour:~0,1%"==" " set hour=0%hour:~1,1%
set minute=%TIME:~3,2%
set second=%TIME:~6,2%

:: Формирование имени файла
set curdate=%yyyy%-%mm%-%dd%-%hour%-%minute%-%second%

:: Выполнение архивации
"C:\Program Files\7-Zip\7z.exe" a -tzip -ssw -mx1 -r0 "%destination%\pyatok-net-backup-%curdate%.zip" "%source%"
```

[Скачать 7z-pyatok-net-to-onedrive.zip](src/7z-pyatok-net-to-onedrive.zip)