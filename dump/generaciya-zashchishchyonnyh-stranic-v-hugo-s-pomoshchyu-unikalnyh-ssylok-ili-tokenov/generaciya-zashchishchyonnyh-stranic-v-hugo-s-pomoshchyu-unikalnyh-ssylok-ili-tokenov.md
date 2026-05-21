---
title: "Генерация защищённых страниц в HUGO с помощью уникальных ссылок или токенов"
slug: generaciya-zashchishchyonnyh-stranic-v-hugo-s-pomoshchyu-unikalnyh-ssylok-ili-tokenov
description: "Генерация защищенных страниц в HUGO"
summary: "SUMMARY"
date: 2025-05-20T00:00:01+02:00
lastmod: 2025-05-20T00:00:02+02:00
draft: false
weight: 61
toc: true
categories: []
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

## Генерация защищённых страниц в HUGO с помощью уникальных ссылок или токенов

### Как работает?

Вы создаёте защищённый контент в Hugo, но доступ к нему ограничиваете с помощью уникальных ссылок или токенов, которые генерируются на этапе сборки сайта.

## Реализация:

### Настройка Hugo:

Создаёте отдельную папку (например, content/private) с защищённым контентом.

В front matter каждой страницы добавляете уникальный токен:

```yaml
title: "Секретная страница"
token: "xyz123"
```

### Шаблон для проверки токена:

В шаблоне (layouts/_default/single.html) добавляете проверку токена через GET-параметр:

``` html
{{ if eq .Params.token (query "token") }}
  {{ .Content }}
{{ else }}
  <p>Доступ запрещён. Введите токен.</p>
{{ end }}
```

### Сборка сайта:

После генерации сайта доступ возможен только по ссылке вроде yoursite.com/private/page?token=xyz123.

## Плюсы:

Полностью статический подход, не требует сервера.

Просто реализуется в Hugo.

## Минусы:

Не полноценная авторизация, а скорее ограничение доступа.

Токены статичны и могут быть переданы другим.

## Когда использовать?

Если вам нужно раздать доступ ограниченному числу людей через уникальные ссылки.