---
title: "Справочник комманд Windows"
slug: windows-cheatsheet
description: "Справочник по коммандам в терминале Windows"
summary: ""
date: 2025-06-21T00:00:01+02:00
lastmod: 2025-06-21T00:00:02+02:00
draft: false
weight:
toc: true
categories: []
tags: [it, windows]
contributors: [mitulka]
pinned: false
homepage: false
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  robots: "" # custom robot tags (optional)
---
## Как запустить «Планировщик задач»?

- Нажимаем кнопку *«Пуск»* вводим **«Планировщик заданий»**, после его появления нажимаем на него.
- Вызываем окно *«Выполнить»* нажав **Win+R** и вводим в нем команду ```taskschd.msc```
- Нажимаем правой кнопкой мыши на кнопку *«Пуск»* и в выпадающем меню выбираем **«Управление компьютером»**. Щелкаем по узлу **«Служебные программы»** и там находим **«Планировщик заданий»**.

![Планировщик заданий](img/01-windows-cheatsheet.png)

## Total Commander

### Настройка стрелок как PageUp/PageDown

- Открыть файл конфигурации: `Конфигурация \ Редактировать файлы конфигурации`
- Открывается 2 файла: `wincmd.ini`, `wcx_ftp.ini`
- В `wincmd.ini` после `[Configuration]` добавить:

```html
  SpecialCursorMovement=9
```

- Перезапустить Total Commander