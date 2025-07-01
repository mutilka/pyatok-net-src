---
title: "План реконструкции д. Клинок, ул. Молодежная, д.36"
slug: klinok-mol-36
description: "План реконструкции д. Клинок, ул. Молодежная, д.36"
summary: "Мы используем блог для анонса статей или служебных заметок. Информация в них может быть не актуальной или даже не верной! Актуальную информацию смотрите в разделе «Проекты»."
date: 2025-06-28T00:00:01+02:00
lastmod: 2025-06-28T00:00:02+02:00
draft: false
weight:
toc: true
categories: []
tags: [rebuild, klinok]
contributors: [mitulka]
pinned: false
homepage: false
seo:
  title: "" # custom title (optional)
  description: "" # custom description (recommended)
  canonical: "" # custom canonical URL (optional)
  robots: "" # custom robot tags (optional)
---

![](img/klinok-mol-36.svg)

## ToDo:

- [x] ~~Сделать оси по обе стороны~~
- [x] ~~Сделать подложку с черезстрочной заливкой~~
- [ ] Добавить интерактивность к дереву

# Интерактивная карта участка на Hugo с SVG и JSON

Отличная идея — создать интерактивную карту вашего участка в деревне! Использование **SVG** для визуальной части и **JSON** для данных, интегрированных в ваш сайт на **Hugo** с темой `hugo docs`, — это мощное и гибкое решение. Вот подробная инструкция, как это реализовать:

---

## 1. Подготовьте SVG-файл с планом участка

Сначала вам понадобится векторное изображение вашего участка.

* **Нарисуйте план участка:** Используйте векторный графический редактор, например, **Inkscape** (бесплатный), **Adobe Illustrator** или **Affinity Designer**.
    * **Важно:** Каждый интерактивный объект (дерево, грядка, постройка) должен быть отдельным элементом (путь, круг, прямоугольник и т.д.).
    * **Присвойте уникальные ID:** Каждому такому элементу присвойте уникальный `id`. Это **критически важно** для связывания элементов SVG с данными из JSON. Например: `<rect id="dom" ...>`, `<circle id="yablonya-1" ...>`, `<polygon id="gryadka-pomidory" ...>`.
    * **Сохраните как Plain SVG:** При сохранении выберите опцию "Plain SVG" (Простой SVG) или аналогичную, чтобы минимизировать избыточный код.

---

## 2. Создайте JSON-файл с данными

Этот файл будет содержать всю информацию, которая должна отображаться при наведении на элементы карты.

* **Структура JSON:** Создайте JSON-файл (например, `data.json`) в директории `static` вашего проекта Hugo (например, `static/data/map_data.json`).

    ```json
    {
      "items": [
        {
          "id": "dom",
          "name": "Дом",
          "type": "Постройка",
          "description": "Основное здание, требует ежегодного осмотра кровли.",
          "tasks": [
            {"task_name": "Осмотр крыши", "deadline": "Август", "notes": "Проверить на протечки и повреждения"},
            {"task_name": "Чистка водостоков", "deadline": "Октябрь", "notes": "Перед зимой"}
          ]
        },
        {
          "id": "yablonya-1",
          "name": "Яблоня сорта 'Антоновка'",
          "type": "Дерево",
          "description": "Молодое дерево, посажено 2023 г.",
          "tasks": [
            {"task_name": "Подкормка", "deadline": "Апрель", "notes": "Азотные удобрения"},
            {"task_name": "Обрезка", "deadline": "Март", "notes": "Санитарная обрезка"}
          ]
        },
        {
          "id": "gryadka-pomidory",
          "name": "Грядка с томатами",
          "type": "Грядка",
          "description": "Используется для выращивания индетерминантных сортов томатов.",
          "tasks": [
            {"task_name": "Подвязка", "deadline": "Июнь", "notes": "По мере роста"},
            {"task_name": "Пасынкование", "deadline": "Весь сезон", "notes": "Регулярно"}
          ]
        }
        // Добавьте другие элементы по аналогии
      ]
    }
    ```

    * **`id`:** Должен точно совпадать с `id` соответствующего элемента в SVG.
    * **`name`:** Название элемента для отображения.
    * **`type`:** Категория элемента (для фильтрации или стилизации).
    * **`description`:** Общее описание.
    * **`tasks`:** Массив объектов с задачами, сроками и примечаниями.

---

## 3. Интеграция SVG и JSON в страницу Hugo

Вам нужно создать страницу Hugo, которая будет загружать SVG, JSON и управлять интерактивностью.

### 3.1. Создание шорткода (рекомендуется)

Шорткод позволит вам легко вставлять карту на любую страницу или запись. Создайте файл `layouts/shortcodes/interactive_map.html`:

```html
<div id="interactive-map-container" style="position: relative;">
    {{ with .Get "svg_path" }}
        {{ $svgContent := readFile . }}
        {{ $svgContent | safeHTML }}
    {{ else }}
        <p>Ошибка: Укажите путь к SVG-файлу.</p>
    {{ end }}

    <div id="tooltip" style="position: absolute; background-color: rgba(0,0,0,0.8); color: white; padding: 10px; border-radius: 5px; display: none; z-index: 1000;">
        <h3></h3>
        <p></p>
        <h4>Необходимые работы:</h4>
        <ul id="tasks-list"></ul>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const svgContainer = document.getElementById('interactive-map-container');
        const tooltip = document.getElementById('tooltip');
        const tooltipTitle = tooltip.querySelector('h3');
        const tooltipDescription = tooltip.querySelector('p');
        const tasksList = tooltip.querySelector('#tasks-list');

        let mapData = {}; // Здесь будут храниться данные из JSON

        // Загрузка JSON-данных
        fetch('/data/map_data.json') // Путь к вашему JSON-файлу
            .then(response => response.json())
            .then(data => {
                mapData = data.items.reduce((acc, item) => {
                    acc[item.id] = item;
                    return acc;
                }, {});
                attachEventListeners(); // Прикрепляем слушателей после загрузки данных
            })
            .catch(error => console.error('Ошибка загрузки данных карты:', error));

        function attachEventListeners() {
            const svgElement = svgContainer.querySelector('svg');
            if (!svgElement) {
                console.error("SVG элемент не найден внутри контейнера.");
                return;
            }

            svgElement.querySelectorAll('[id]').forEach(element => {
                const elementId = element.id;
                if (mapData[elementId]) {
                    element.addEventListener('mouseenter', function(e) {
                        const data = mapData[elementId];
                        tooltipTitle.textContent = data.name;
                        tooltipDescription.textContent = data.description;
                        tasksList.innerHTML = '';
                        if (data.tasks && data.tasks.length > 0) {
                            data.tasks.forEach(task => {
                                const li = document.createElement('li');
                                li.innerHTML = `<strong>${task.task_name}</strong> (Срок: ${task.deadline})<br>${task.notes}`;
                                tasksList.appendChild(li);
                            });
                        } else {
                            tasksList.innerHTML = '<li>Нет запланированных работ.</li>';
                        }

                        // Позиционирование тултипа
                        tooltip.style.left = `${e.clientX + 15}px`;
                        tooltip.style.top = `${e.clientY + 15}px`;
                        tooltip.style.display = 'block';

                        // Добавляем класс для подсветки элемента SVG
                        element.classList.add('highlight-svg-element');
                    });

                    element.addEventListener('mouseleave', function() {
                        tooltip.style.display = 'none';
                        element.classList.remove('highlight-svg-element');
                    });
                }
            });
        }
    });
</script>

<style>
    /* Базовые стили для SVG-элементов */
    #interactive-map-container svg * {
        transition: fill 0.3s ease, stroke 0.3s ease; /* Плавный переход при наведении */
        cursor: pointer;
    }

    /* Стиль при наведении */
    #interactive-map-container svg *.highlight-svg-element {
        fill: rgba(255, 255, 0, 0.5) !important; /* Желтая полупрозрачная заливка */
        stroke: #FFD700 !important; /* Золотая обводка */
        stroke-width: 2px !important;
    }

    /* Если у вас есть элементы без ID, но вы хотите, чтобы они не реагировали */
    #interactive-map-container svg *:not([id]) {
        cursor: default; /* Обычный курсор */
    }
</style>