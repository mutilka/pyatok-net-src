---
title: "Скрипт для создания архива с помощью 7z"
slug: skript-dlya-sozdaniya-arhiva-s-pomoshchyu-7z
description: "Скрипт написан с использованием синтаксиса командного файла Windows (Batch)"
summary: "Мы используем блог для анонса статей или служебных заметок. Информация в них может быть не актуальной или даже не верной! Актуальную информацию смотрите в разделе «Проекты»."
date: 2025-07-21T00:00:01+02:00
lastmod: 2025-07-21T00:00:02+02:00
draft: false
weight:
toc: true
categories: []
tags: [it, windows, batch, bat]
contributors: [mitulka]
pinned: false
homepage: false
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  robots: "" # custom robot tags (optional)
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