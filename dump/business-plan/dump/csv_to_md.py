import pandas as pd
import os
import tkinter as tk
from tkinter import filedialog

# Получаем папку скрипта
script_dir = os.path.dirname(os.path.abspath(__file__))

# Запрашиваем CSV-файл
root = tk.Tk()
root.withdraw()
csv_path = filedialog.askopenfilename(
    initialdir=script_dir,
    title="Выберите CSV-файл",
    filetypes=[("CSV files", "*.csv")]
)
if not csv_path:
    print("Файл не выбран")
    exit()

# Формируем путь для MD
md_path = os.path.splitext(csv_path)[0] + ".md"

# Читаем CSV, заменяем пустые значения
df = pd.read_csv(csv_path, sep=",", encoding="utf-8", keep_default_na=False, na_values=[''])
df = df.fillna("")

# Преобразуем float → int, если без потери
def clean_floats(val):
    if isinstance(val, float) and val.is_integer():
        return str(int(val))
    return str(val)

df = df.applymap(clean_floats)

# Конвертируем в Markdown
md_text = df.to_markdown(index=False, tablefmt="pipe")

# Заменяем строку выравнивания вручную
lines = md_text.splitlines()
if len(lines) >= 2:
    lines[1] = "|:--:|:--|:--:|:--:|:--:|:--|"  # выравнивание: центр, лево, центр, центр, центр, центр
    md_text = "\n".join(lines)

# Сохраняем в MD
with open(md_path, "w", encoding="utf-8") as f:
    f.write(md_text)

print(f"Markdown-таблица сохранена в {md_path}")
