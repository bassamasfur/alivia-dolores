from PIL import Image
import os

# Crear directorio si no existe
os.makedirs('c:/source/Ejemplo/AliviaDol/alivia_dolores/assets/store', exist_ok=True)

# Abrir la imagen (asumiendo que la guardaremos como screenshot.png)
img = Image.open('c:/source/Ejemplo/AliviaDol/alivia_dolores/assets/store/screenshot_original.png')

# Dimensiones requeridas para Feature Graphic
target_width = 1024
target_height = 500

# Calcular el recorte centrado para mantener proporciones
img_width, img_height = img.size
aspect_ratio_target = target_width / target_height
aspect_ratio_img = img_width / img_height

if aspect_ratio_img > aspect_ratio_target:
    # Imagen más ancha, recortar los lados
    new_width = int(img_height * aspect_ratio_target)
    left = (img_width - new_width) // 2
    img_cropped = img.crop((left, 0, left + new_width, img_height))
else:
    # Imagen más alta, recortar arriba/abajo
    new_height = int(img_width / aspect_ratio_target)
    top = (img_height - new_height) // 2
    img_cropped = img.crop((0, top, img_width, top + new_height))

# Redimensionar a las dimensiones exactas
feature_graphic = img_cropped.resize((target_width, target_height), Image.Resampling.LANCZOS)

# Guardar
output_path = 'c:/source/Ejemplo/AliviaDol/alivia_dolores/assets/store/feature_graphic.png'
feature_graphic.save(output_path, 'PNG', optimize=True)

print(f"✅ Feature Graphic creado: {output_path}")
print(f"   Dimensiones: {target_width}x{target_height}px")
print(f"   Tamaño: {os.path.getsize(output_path) / 1024:.1f} KB")
