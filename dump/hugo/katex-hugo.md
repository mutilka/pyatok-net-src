# Как настроить KaTeX на Hugo

KaTeX — это быстрая и легкая библиотека для рендеринга LaTeX на веб-страницах. Вот пошаговая инструкция по настройке KaTeX на Hugo.

1. Подготовка окружения
Убедитесь, что Hugo установлен и сайт работает. Если нет, создайте новый сайт:
```bash
hugo new site my-site
cd my-site
```
2. Добавление KaTeX в проект
KaTeX требует CSS и JavaScript файлы. Вы можете использовать CDN или локальные файлы.
Вариант с CDN
Добавьте в layouts/partials/head.html:
```
html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css" integrity="sha384-nB0miv6/jRmo5UMMR1wu3Gz6NLsoTkbqJghGIsx//Rlm+ZU03BU6SQNC66uf4l5+" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.js" integrity="sha384-7zkQWkzuo3B5mTepMUcHkMB5jZaolc2xDwL6VFqjFALcbeS9Ggm/Yr2r3Dy4lfFg" crossorigin="anonymous"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/auto-render.min.js" integrity="sha384-43gviWU0YVjaDtb/GhzOouOXtZMP/7XUzwPTstBeZFe/+rCMvRwr4yROQP43s0Xk" crossorigin="anonymous"></script>
```
Вариант с локальными файлами
Скачайте katex.min.css, katex.min.js и auto-render.min.js с репозитория KaTeX.
Поместите katex.min.css в static/css, а katex.min.js и auto-render.min.js в static/js.
Подключите в шаблоне:
```
html
<link rel="stylesheet" href="{{ "css/katex.min.css" | relURL }}">
<script defer src="{{ "js/katex.min.js" | relURL }}"></script>
<script defer src="{{ "js/auto-render.min.js" | relURL }}"></script>
```
3. Настройка автоматического рендеринга
Добавьте после подключения auto-render.min.js:
```
html
<script>
  document.addEventListener("DOMContentLoaded", function() {
    renderMathInElement(document.body, {
      delimiters: [
        { left: "$$", right: "$$", display: true },
        { left: "$", right: "$", display: false },
        { left: "\\(", right: "\\)", display: false },
        { left: "\\[", right: "\\]", display: true }
      ],
      throwOnError: false
    });
  });
</script>
```
4. Условное включение KaTeX
Создайте layouts/partials/katex.html:
```
html
<link rel="stylesheet" href="{{ "css/katex.min.css" | relURL }}">
<script defer src="{{ "js/katex.min.js" | relURL }}"></script>
<script defer src="{{ "js/auto-render.min.js" | relURL }}"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    renderMathInElement(document.body, {
      delimiters: [
        { left: "$$", right: "$$", display: true },
        { left: "$", right: "$", display: false },
        { left: "\\(", right: "\\)", display: false },
        { left: "\\[", right: "\\]", display: true }
      ],
      throwOnError: false
    });
  });
</script>
```
В head.html добавьте:
```
html
{{ if or .Params.math .Site.Params.math }}
  {{ partial "katex.html" . }}
{{ end }}
В front matter поста укажите:
```yaml
title: "Мой пост с формулами"
math: true
```
## 5. Использование в Markdown
- Встроенные: `$E = mc^2$` или `\(E = mc^2\)`
- Блочные:
  
∫
a
b
x
2
d
x
или
  
∫
a
b
x
2
d
x

## 6. Тестирование
Создайте тестовый пост:
```markdown
---
title: "Тест KaTeX"
math: true
---
Это встроенная формула: $a^2 + b^2 = c^2$.

А это блочная:
$$ \sum_{i=0}^{n} i^2 = \frac{n(n+1)(2n+1)}{6} $$
```

Запустите сервер:
bash
hugo server
Проверьте результат в браузере.

---

### Что дальше?
- Скопируйте этот текст в файл `katex_hugo.md`.
- Для создания PDF используйте `pandoc`:
```bash
  pandoc katex_hugo.md -o katex_hugo.pdf --pdf-engine=xelatex
```
  (Убедитесь, что Pandoc и TeX установлены.)
  
Если нужно что-то уточнить или изменить, дайте знать!

### Текст требует уточнений, кто-то напиздюхал!
