---
title: "Настройка синхронизации с помощью rsync"
description: "Рассказываю и показываю как настроить синхрогизацию с помощью rsync"
slug: rsync
summary: "Мы используем блог для анонса статей или служебных заметок. Информация в них может быть не актуальной или даже не верной! Актуальную информацию смотрите в соответствующих разделах."
date: 2026-02-25T00:00:01+03:00
lastmod: 2026-02-25T00:00:02+03:00
draft: false
tags: ["rsync", "настройка"]
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
  image: "/posts/hello-world/img/cover-hello-world.jpg" # путь к обложке поста
  alt: "Hello, World!" # alt text
  caption: "Настройка Hello, World!" # display caption under cover
  relative: true # when using page bundles set this to true
  hidden: false # only hide on current single page
editPost:
    URL: "https://github.com/<path_to_repo>/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---

# 🔄 Единая конфигурация rsync для всех устройств

> **Важно:** Нужно привести команды к одному виду. На телефоне нет `--delete`, а на ноутбуке есть — это неправильно. **Должно быть одинаково.**

## 🛠 Единые параметры для ВСЕХ устройств

```bash
rsync -avz --progress --backup --backup-dir="#recycle" --delete /путь/к/локальной/папке/ rsync@192.168.100.2::MKE/
```

## 📋 Готовые команды

### 📱 Телефон (Termux)

```bash
rsync -avz --progress --backup --backup-dir="#recycle" --delete ~/storage/downloads/MKE/ rsync@192.168.100.2::MKE/
```

### 💻 Ноутбуки (PowerShell в D:\)

```powershell
& rsync -avz --progress --backup --backup-dir="#recycle" --delete MKE rsync@192.168.100.2::MKE/
```

## 📊 Что теперь происходит на ВСЕХ устройствах

| Параметр | Работа |
| :--- | :--- |
| `-avz` | Архивация + сжатие + подробно |
| `--progress` | Показывает прогресс |
| `--backup` | Включает резервное копирование |
| `--backup-dir="#recycle"` | Куда складывать старые версии |
| `--delete` | Удаляет на NAS то, чего нет в источнике (но старые версии уже в `#recycle`) |

---

✅ **Теперь абсолютно одинаковое поведение на всех устройствах!**