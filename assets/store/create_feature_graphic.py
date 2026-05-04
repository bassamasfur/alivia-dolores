from PIL import Image, ImageDraw, ImageFont
import os

# Crear directorio
os.makedirs('c:/source/Ejemplo/AliviaDol/alivia_dolores/assets/store', exist_ok=True)

# Crear imagen 1024x500
width, height = 1024, 500
img = Image.new('RGB', (width, height), color='white')
draw = ImageDraw.Draw(img)

# Gradiente de fondo (púrpura a turquesa)
for y in range(height):
    ratio = y / height
    r = int(109 + (70 - 109) * ratio)  # 109 (6D) -> 70 (46)
    g = int(91 + (194 - 91) * ratio)   # 91 (5B) -> 194 (C2)
    b = int(255 + (203 - 255) * ratio) # 255 (FF) -> 203 (CB)
    draw.rectangle([(0, y), (width, y+1)], fill=(r, g, b))

# Texto principal
try:
    # Intentar usar fuente del sistema
    title_font = ImageFont.truetype("arial.ttf", 72)
    subtitle_font = ImageFont.truetype("arial.ttf", 36)
    desc_font = ImageFont.truetype("arial.ttf", 28)
except:
    # Fallback a fuente por defecto
    title_font = ImageFont.load_default()
    subtitle_font = ImageFont.load_default()
    desc_font = ImageFont.load_default()

# Título
title = "AliviaDol"
title_bbox = draw.textbbox((0, 0), title, font=title_font)
title_width = title_bbox[2] - title_bbox[0]
title_x = (width - title_width) // 2
draw.text((title_x, 80), title, fill='white', font=title_font)

# Subtítulo
subtitle = "Alivio natural con nutrición"
subtitle_bbox = draw.textbbox((0, 0), subtitle, font=subtitle_font)
subtitle_width = subtitle_bbox[2] - subtitle_bbox[0]
subtitle_x = (width - subtitle_width) // 2
draw.text((subtitle_x, 180), subtitle, fill='white', font=subtitle_font)

# Descripción
desc = "15 dolencias comunes • Consejos nutricionales • Recetas rápidas"
desc_bbox = draw.textbbox((0, 0), desc, font=desc_font)
desc_width = desc_bbox[2] - desc_bbox[0]
desc_x = (width - desc_width) // 2
draw.text((desc_x, 250), desc, fill='white', font=desc_font)

# Emojis representativos
emojis = "🔥 😰 🦵 🍺 🦴 🤕 🗣️ 🦷 🩸 💪 🚽 😴 🫃 🤢 🤧"
emojis_bbox = draw.textbbox((0, 0), emojis, font=desc_font)
emojis_width = emojis_bbox[2] - emojis_bbox[0]
emojis_x = (width - emojis_width) // 2
draw.text((emojis_x, 350), emojis, fill='white', font=desc_font)

# Guardar
output_path = 'c:/source/Ejemplo/AliviaDol/alivia_dolores/assets/store/feature_graphic.png'
img.save(output_path, 'PNG', optimize=True)

print(f"✅ Feature Graphic creado: {output_path}")
print(f"   Dimensiones: {width}x{height}px")
print(f"   Tamaño: {os.path.getsize(output_path) / 1024:.1f} KB")
