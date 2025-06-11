---
title: "Уютный блог на HUGO"
description: "Рассказываю и показываю как настроить уютный блог HUGO"
slug: blog-na-gohugo
summary: "Мы используем блог для анонса статей или служебных заметок. Информация в них может быть не актуальной или даже не верной! Актуальную информацию смотрите в разделе «Проекты»."
date: 2025-06-11T00:00:01+02:00
lastmod: 2025-06-11T00:00:02+02:00
draft: false
weight:
toc: true
categories: [blog]
tags: [it, настройка, hugo]
contributors: [mitulka]
pinned: false
homepage: false
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  robots: "" # custom robot tags (optional)
---

[Уютный блог на Hugo + GitHub Page](https://owlpaw.com/blog/hugo-simple-blog/)

# Бесплатный хостинг и деплой блога на Hugo

Рассмотрим, как поднять, захостить и настроить деплой блога на Hugo, не потратив ни копейки (или почти).

![Бесплатный хостинг и деплой блога на Hugo](./img/02-blog-na-gohugo.jpg)

## Не путайте Hygge и Hugo
Hygge — датское слово, обозначающее уют и тепло. Hugo — генератор статических страниц, который обеспечивает комфорт в работе.

## Hugo — наш уютный друг
Hugo генерирует статические HTML-файлы. Мы размещаем текст в формате Markdown и изображения в нужных папках, а Hugo собирает из них готовые страницы.

### Установка и первый старт
1. Установите `git` и `Hugo`. Для Fedora 36:
   sudo dnf update
   sudo dnf install git hugo
   Для других ОС смотрите документацию Hugo.

2. Инициализируйте новый блог для хостинга на GitHub Pages (нужен аккаунт и репозиторий `<username>.github.io`):
```
    hugo new site <username>.github.io
    cd <username>.github.io
```
3. Создайте `.gitignore`, чтобы исключить папку `/public`:
```
    echo "/public" > .gitignore
```
4. Инициализируйте Git-репозиторий:
```
    git init
    git branch -M main
    git remote add origin git@github.com:<username>/<username>.github.io.git
```
Базовый проект готов, но он пока без темы.

### Настройка темы
1. Выберите тему, например, PaperMod. Установите её:
```
    git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
    git submodule update --init --recursive
    ```
2. Настройте тему, создав файл `config.yml`:
    ```
    rm config.toml
    vim config.yml
```
3. Добавьте настройки (пример для PaperMod):
```
    baseURL: "https://username.github.io/"
    title: My new site
    paginate: 10
    theme: PaperMod

    enableRobotsTXT: true
    buildDrafts: false
    buildFuture: false
    buildExpired: false

    minify:
     disableXML: true
     minifyOutput: true

    params:
     env: production
     title: ExampleSite
     description: "This is long-long description..."
     keywords: [Blog, Portfolio, PaperMod]
     author: My name there
     DateFormat: "January 2, 2006"
     defaultTheme: auto
     disableThemeToggle: false
     ShowReadingTime: true
     ShowPostNavLinks: true
     ShowCodeCopyButtons: true
     ShowWordCount: true
     ShowRssButtonInSectionTermList: true
     UseHugoToc: true
     disableSpecial1stPost: false
     disableScrollToTop: false
     hidemeta: false
     hideSummary: true
     showtoc: false
     tocopen: false

    assets:
     favicon: "<link / abs url>"
     favicon16x16: "<link / abs url>"
     favicon32x32: "<link / abs url>"
     apple_touch_icon: "<link / abs url>"
     safari_pinned_tab: "<link / abs url>"

    label:
     text: "Home"
     icon: /apple-touch-icon.png
     iconHeight: 35

   profileMode:
     enabled: false
     title: ExampleSite
     subtitle: "This is subtitle"
     imageUrl: "<img location>"
     imageWidth: 120
     imageHeight: 120
     imageTitle: my image
   
    buttons:
       - name: Posts
         url: posts
       - name: Tags
         url: tags

   homeInfoParams:
     Title: "Hi there \U0001F44B"
     Content: Welcome to my blog

   socialIcons:
     - name: twitter
       url: "https://twitter.com/"
     - name: stackoverflow
       url: "https://stackoverflow.com"
     - name: github
       url: "https://github.com/"

   cover:
     hidden: true
     hiddenInList: true
     hiddenInSingle: true

   fuseOpts:
     isCaseSensitive: false
     shouldSort: true
     location: 0
     distance: 1000
     threshold: 0.4
     minMatchCharLength: 0
     keys: ["title", "permalink", "summary", "content"]

   menu:
     main:
       - identifier: categories
         name: categories
         url: /categories/
         weight: 10
       - identifier: tags
         name: tags
         url: /tags/
         weight: 20
       - identifier: example
         name: example.org
         url: https://example.org
         weight: 30

    pygmentsUseClasses: true

    markup:
        highlight:
        noClasses: false
```
4. Проверьте результат:
   `hugo server`
   Блог доступен по адресу `localhost:1313`.

### Создание первой записи
1. Создайте папку для поста:
```
    mkdir -p content/posts/first-post
    vim content/posts/first-post/index.md
```
2. Добавьте шаблон поста:
```
   ---
   title: "My 1st post"
   date: 2022-12-08T11:30:03+00:00
   tags: ["first"]
   author: "Me"
   showToc: true
   TocOpen: false
   draft: false
   hidemeta: false
   comments: false
   description: "Desc Text."
   canonicalURL: "https://canonical.url/to/page"
   disableHLJS: true
   disableShare: false
   hideSummary: false
   searchHidden: true
   ShowReadingTime: true
   ShowBreadCrumbs: true
   ShowPostNavLinks: true
   ShowWordCount: true
   ShowRssButtonInSectionTermList: true
   UseHugoToc: true
   cover:
       image: "<image path/url>"
       alt: "<alt text>"
       caption: "<text>"
       relative: false
       hidden: true
   editPost:
       URL: "https://github.com/<path_to_repo>/content"
       Text: "Suggest Changes"
       appendFilePath: true
   ---
```
3. Проверьте блог:
   hugo server

### Деплой на GitHub Pages
1. Настройте Git:
   git config --global user.name "<Your Name>"
   git config --global user.email "<Your Email>"

2. Сгенерируйте SSH-ключи:
   ssh-keygen -t rsa -b 4096 -C "$(git config user.email)" -f deployment -N ""

3. Добавьте публичный ключ в GitHub:
   - В репозитории: `Settings → Deploy Keys → Add Deploy Key`.
   - Скопируйте ключ: `cat deployment.pub`.
   - Включите `Allow write access`.

4. Добавьте приватный ключ в секреты:
   - `Settings → Secrets → Actions → New Repository Secret`.
   - Имя: `ACTIONS_DEPLOY_KEY`.
   - Скопируйте: `cat deployment`.

5. Настройте права Actions:
   - `Actions → General → Workflow permissions → Read and write permissions`.

6. Создайте GitHub Action:
   mkdir -p .github/workflows
   vim .github/workflows/gh-pages.yml

   Вставьте:
   name: GitHub Pages
   on:
     push:
       branches:
         - main
   jobs:
     build-deploy:
       runs-on: ubuntu-latest
       concurrency:
         group: ${{ github.workflow }}-${{ github.ref }}
       steps:
         - name: Checkout
           uses: actions/checkout@v3
           with:
             submodules: true
             fetch-depth: 0
         - name: Setup Hugo
           uses: peaceiris/actions-hugo@v2
           with:
             hugo-version: "latest"
             extended: true
         - name: Build
           run: hugo --minify
         - name: Deploy
           uses: peaceiris/actions-gh-pages@v3
           if: ${{ github.ref == 'refs/heads/main' }}
           with:
             github_token: ${{ secrets.GITHUB_TOKEN }}
             publish_branch: gh-pages
             publish_dir: ./public

7. Запушьте изменения:
   git add . && git commit -m "Init" && git push -u origin main

8. Настройте Pages:
   - `Settings → Pages → Build and deployment`.
   - Выберите `Deploy from a branch`, ветка `gh-pages`.

9. Проверьте блог по адресу `<username>.github.io`.

### Использование своего домена
1. Купите домен (например, на `beget.com`).
2. Настройте DNS:
   - Добавьте A и AAAA записи (IP-адреса из GitHub Pages).
   - Удалите дефолтные записи.
   - Для `www` добавьте CNAME на `<yourdomen.com>`.

3. Создайте файл `static/CNAME`:
   echo "<yourdomen.com>" > static/CNAME

4. Настройте домен в GitHub:
   - `Settings → Pages → Custom domain`.
   - Впишите `<yourdomen.com>`.

5. Если TLS-сертификат не подхватился:
   - В DNS: для `www.<yourdomen.com>` укажите CNAME на `<username>.github.io`.
   - Удалите кастомный домен в GitHub, подождите 5 минут, добавьте заново `<yourdomen.com>`.

### Кастомные Shortcode
Для вставки Bandcamp-плеера создайте шорткод:
1. Создайте файл:
   mkdir -p layouts/shortcodes
   vim layouts/shortcodes/bandcamp.html

2. Добавьте код:
   {{- $id := .Get "id" -}}
   {{- with .Get "type" -}}
   {{- if eq . "track" -}}
   <div style="margin: 0px 10px 10px 10px;">
     <iframe
       style="border: 0; width: 350px; height: 350px;"
       src="https://bandcamp.com/EmbeddedPlayer/track={{ $id }}/size=large/bgcol=333333/linkcol=9a64ff/minimal=true/transparent=true/"
     >
     </iframe>
   </div>
   {{- else if eq . "album" -}}
   <div style="margin: 0px 10px 10px 10px;">
     <iframe
       style="border: 0; width: 350px; height: 350px;"
       src="https://bandcamp.com/EmbeddedPlayer/album={{ $id }}/size=large/bgcol=333333/linkcol=9a64ff/minimal=true/transparent=true/"
     >
     </iframe>
   </div>
   {{- end -}}
   {{- end -}}

3. Используйте в Markdown:
   {{</* bandcamp id="3756810824" type="track" */>}}

### Кастомные страницы
Для страницы с музыкой:
1. Создайте файл:
   mkdir -p content/music
   vim content/music/index.md

   Добавьте:
   ---
   title: "Music"
   Description: "Music page"
   layout: "music"
   ---
   {{</* bandcamp id="3756810824" type="track" */>}}
   {{</* bandcamp id="1062007976" type="album" */>}}

2. Создайте шаблон:
   mkdir -p layouts/page
   vim layouts/page/music.html

   Добавьте:
   {{ define "main" }}
   <main id="main-content" class="grow">
       <header>
           <h1 class="mt-0 text-4xl font-extrabold text-neutral-900 dark:text-neutral">Music</h1>
       </header>
       <section class="flex flex-wrap -mx-2 place-content-center overflow-hidden">
           <div class="container my-3">
               <div class="row">
                   <div class="flex flex-wrap">{{ .Content }}</div>
               </div>
           </div>
       </section>
   </main>
   {{ end }}

3. Добавьте в меню (`config.yml`):
   [[main]]
     name = "Music"
     pageRef = "music"
     weight = 20

### Упрощение деплоя
Создайте алиас для пуша изменений:
1. Откройте `~/.zshrc` (или `~/.bashrc`):
   vim ~/.zshrc

2. Добавьте:
   alias post-save="git add . && git commit -m \"Added new post\" && git push"

3. Примените:
   source ~/.zshrc

4. Используйте:
   post-savepandoc -s -r html https://owlpaw.com/blog/hugo-simple-blog/ -o example12.md