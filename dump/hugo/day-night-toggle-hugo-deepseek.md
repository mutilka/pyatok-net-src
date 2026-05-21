# Добавим переключатель темы в шаблон Hugo. Вот пошаговое решение:

1. **Добавьте CSS-переменные** в ваш файл стилей (например, `assets/css/main.css`):

```css
:root {
  --bg-color: #ffffff;
  --text-color: #333333;
  --link-color: #1a73e8;
}

[data-theme="dark"] {
  --bg-color: #1a1a1a;
  --text-color: #e0e0e0;
  --link-color: #8ab4f8;
}

body {
  background-color: var(--bg-color);
  color: var(--text-color);
  transition: background-color 0.3s, color 0.3s;
}

a {
  color: var(--link-color);
}
```

2. **Создайте частичный шаблон** для переключателя (`layouts/partials/theme-toggle.html`):

```html
<button id="theme-toggle" aria-label="Переключить тему">
  <svg class="sun" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="..."/></svg>
  <svg class="moon" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="..."/></svg>
</button>
```

3. **Добавьте JavaScript** (`assets/js/theme-toggle.js`):

```javascript
function setTheme(theme) {
  document.documentElement.setAttribute('data-theme', theme);
  localStorage.setItem('theme', theme);
}

function toggleTheme() {
  const currentTheme = localStorage.getItem('theme') || 'light';
  const newTheme = currentTheme === 'light' ? 'dark' : 'light';
  setTheme(newTheme);
}

// Инициализация темы
(function() {
  const savedTheme = localStorage.getItem('theme');
  const systemDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  
  if (savedTheme) {
    setTheme(savedTheme);
  } else if (systemDark) {
    setTheme('dark');
  }
})();

document.getElementById('theme-toggle').addEventListener('click', toggleTheme);
```

4. **Включите переключатель** в нужном месте шаблона (например, в `layouts/_default/baseof.html`):

```html
<!DOCTYPE html>
<html lang="{{ .Site.LanguageCode }}" data-theme="light">
<head>
  <!-- ... -->
  {{ $styles := resources.Get "css/main.css" | minify | fingerprint }}
  <link rel="stylesheet" href="{{ $styles.Permalink }}">
</head>
<body>
  {{ partial "theme-toggle.html" . }}
  
  {{ $js := resources.Get "js/theme-toggle.js" | minify | fingerprint }}
  <script src="{{ $js.Permalink }}"></script>
</body>
</html>
```

5. **Добавьте стили для кнопки**:

```css
#theme-toggle {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background: var(--bg-color);
  border: 1px solid var(--text-color);
  border-radius: 50%;
  padding: 10px;
  cursor: pointer;
}

.moon { display: none; }
[data-theme="dark"] .sun { display: none; }
[data-theme="dark"] .moon { display: block; }
```

Для SVG-иконок можно использовать:
- Солнце: https://pastebin.com/raw/4MjPk2Y5
- Луна: https://pastebin.com/raw/5BjU7fL1

**Особенности реализации:**
- Сохраняет выбор пользователя в localStorage
- Учитывает системные настройки по умолчанию
- Плавные переходы между темами
- Работает без перезагрузки страницы
- Доступен для скринридеров

Обновите свои существующие стили, заменив фиксированные цвета на CSS-переменные для полной поддержки тем.