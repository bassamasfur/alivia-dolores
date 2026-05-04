# Script simplificado para crear capturas de pantalla Google Play Store
Add-Type -AssemblyName System.Drawing

$outputDir = "assets\store\screenshots"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Relacion 9:16 (1080x1920)
$w = 1080
$h = 1920

Write-Host "Creando capturas de pantalla ${w}x${h}px..." -ForegroundColor Cyan

# ============================================
# SCREENSHOT 1: Home Grid
# ============================================
$bitmap1 = New-Object System.Drawing.Bitmap($w, $h)
$g1 = [System.Drawing.Graphics]::FromImage($bitmap1)
$g1.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g1.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Fondo
$bgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(245, 247, 250))
$g1.FillRectangle($bgBrush, 0, 0, $w, $h)

# Header morado
$headerBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(109, 91, 255))
$g1.FillRectangle($headerBrush, 0, 0, $w, 200)

# Titulo blanco centrado
$titleFont = New-Object System.Drawing.Font("Segoe UI", 48, [System.Drawing.FontStyle]::Bold)
$whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
$sf = New-Object System.Drawing.StringFormat
$sf.Alignment = [System.Drawing.StringAlignment]::Center
$sf.LineAlignment = [System.Drawing.StringAlignment]::Center
$titleRect = New-Object System.Drawing.RectangleF(0.0, 60.0, [float]$w, 80.0)
$g1.DrawString("AliviaDol", $titleFont, $whiteBrush, $titleRect, $sf)

# Subtitulo
$subtitleFont = New-Object System.Drawing.Font("Segoe UI", 28)
$subtitleRect = New-Object System.Drawing.RectangleF(0.0, 140.0, [float]$w, 50.0)
$g1.DrawString("Dolencias comunes", $subtitleFont, $whiteBrush, $subtitleRect, $sf)

# Cards (simulacion simple)
$cardColors = @(
    [System.Drawing.Color]::FromArgb(255, 243, 235),
    [System.Drawing.Color]::FromArgb(232, 245, 255),
    [System.Drawing.Color]::FromArgb(255, 248, 232),
    [System.Drawing.Color]::FromArgb(255, 235, 245),
    [System.Drawing.Color]::FromArgb(245, 250, 235),
    [System.Drawing.Color]::FromArgb(248, 235, 255)
)
$cardTitles = @("Acidez", "Ansiedad", "Calambres", "Resaca", "Articulaciones", "Cabeza")
$cardFont = New-Object System.Drawing.Font("Segoe UI", 22, [System.Drawing.FontStyle]::Bold)
$blackBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(50, 50, 50))

for ($i = 0; $i -lt 6; $i++) {
    $col = $i % 3
    $row = [math]::Floor($i / 3)
    $cx = 40 + ($col * 350)
    $cy = 250 + ($row * 310)
    
    $cardBrush = New-Object System.Drawing.SolidBrush($cardColors[$i])
    $g1.FillRectangle($cardBrush, $cx, $cy, 320, 280)
    
    # Icono circular
    $iconBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(180, 255, 255, 255))
    $g1.FillEllipse($iconBrush, $cx + 110, $cy + 70, 100, 100)
    
    # Texto
    $textRect = New-Object System.Drawing.RectangleF([float]$cx, [float]($cy + 180), 320.0, 80.0)
    $g1.DrawString($cardTitles[$i], $cardFont, $blackBrush, $textRect, $sf)
    
    $cardBrush.Dispose()
    $iconBrush.Dispose()
}

# Guardar
$out1 = "$outputDir\01_home_grid.png"
$bitmap1.Save($out1, [System.Drawing.Imaging.ImageFormat]::Png)

# Limpiar
$g1.Dispose()
$bitmap1.Dispose()
$bgBrush.Dispose()
$headerBrush.Dispose()
$titleFont.Dispose()
$whiteBrush.Dispose()
$sf.Dispose()
$subtitleFont.Dispose()
$cardFont.Dispose()
$blackBrush.Dispose()

$size1 = [math]::Round((Get-Item $out1).Length / 1KB, 2)
Write-Host "OK Screenshot 1: $size1 KB" -ForegroundColor Green

# ============================================
# SCREENSHOT 2: Detail View
# ============================================
$bitmap2 = New-Object System.Drawing.Bitmap($w, $h)
$g2 = [System.Drawing.Graphics]::FromImage($bitmap2)
$g2.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g2.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Fondo
$bgBrush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(245, 247, 250))
$g2.FillRectangle($bgBrush2, 0, 0, $w, $h)

# Header morado
$headerBrush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(109, 91, 255))
$g2.FillRectangle($headerBrush2, 0, 0, $w, 300)

# Icono circular
$iconBrush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(200, 255, 255, 255))
$g2.FillEllipse($iconBrush2, 470, 80, 140, 140)

# Titulo
$titleFont2 = New-Object System.Drawing.Font("Segoe UI", 42, [System.Drawing.FontStyle]::Bold)
$whiteBrush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
$sf2 = New-Object System.Drawing.StringFormat
$sf2.Alignment = [System.Drawing.StringAlignment]::Center
$sf2.LineAlignment = [System.Drawing.StringAlignment]::Center
$titleRect2 = New-Object System.Drawing.RectangleF(0.0, 220.0, [float]$w, 60.0)
$g2.DrawString("Acidez / Reflujo", $titleFont2, $whiteBrush2, $titleRect2, $sf2)

# Seccion verde "Come mas"
$greenBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(230, 250, 235))
$g2.FillRectangle($greenBrush, 40, 350, $w - 80, 400)

$greenTextBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(56, 142, 60))
$sectionFont = New-Object System.Drawing.Font("Segoe UI", 32, [System.Drawing.FontStyle]::Bold)
$leftSf = New-Object System.Drawing.StringFormat
$leftSf.Alignment = [System.Drawing.StringAlignment]::Near
$greenHeaderRect = New-Object System.Drawing.RectangleF(60.0, 380.0, [float]($w - 120), 60.0)
$g2.DrawString("Come mas:", $sectionFont, $greenTextBrush, $greenHeaderRect, $leftSf)

# Items
$itemFont = New-Object System.Drawing.Font("Segoe UI", 24)
$blackBrush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(60, 60, 60))
$items = @("Platanos", "Avena", "Jengibre", "Papaya")
for ($i = 0; $i -lt 4; $i++) {
    $iy = 470 + ($i * 60)
    $itemRect = New-Object System.Drawing.RectangleF(80.0, [float]$iy, [float]($w - 160), 50.0)
    $g2.DrawString("- $($items[$i])", $itemFont, $blackBrush2, $itemRect, $leftSf)
}

# Seccion roja "Evita"
$redBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 235, 238))
$g2.FillRectangle($redBrush, 40, 800, $w - 80, 400)

$redTextBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(211, 47, 47))
$redHeaderRect = New-Object System.Drawing.RectangleF(60.0, 830.0, [float]($w - 120), 60.0)
$g2.DrawString("Evita:", $sectionFont, $redTextBrush, $redHeaderRect, $leftSf)

$items2 = @("Cafe", "Alcohol", "Picantes", "Citricos")
for ($i = 0; $i -lt 4; $i++) {
    $iy = 920 + ($i * 60)
    $itemRect2 = New-Object System.Drawing.RectangleF(80.0, [float]$iy, [float]($w - 160), 50.0)
    $g2.DrawString("- $($items2[$i])", $itemFont, $blackBrush2, $itemRect2, $leftSf)
}

# Guardar
$out2 = "$outputDir\02_detail_view.png"
$bitmap2.Save($out2, [System.Drawing.Imaging.ImageFormat]::Png)

# Limpiar
$g2.Dispose()
$bitmap2.Dispose()
$bgBrush2.Dispose()
$headerBrush2.Dispose()
$iconBrush2.Dispose()
$titleFont2.Dispose()
$whiteBrush2.Dispose()
$sf2.Dispose()
$greenBrush.Dispose()
$greenTextBrush.Dispose()
$sectionFont.Dispose()
$leftSf.Dispose()
$itemFont.Dispose()
$blackBrush2.Dispose()
$redBrush.Dispose()
$redTextBrush.Dispose()

$size2 = [math]::Round((Get-Item $out2).Length / 1KB, 2)
Write-Host "OK Screenshot 2: $size2 KB" -ForegroundColor Green

Write-Host "`nCapturas creadas en: $outputDir" -ForegroundColor Cyan
Write-Host "Dimensiones: ${w}x${h}px (9:16 ratio)" -ForegroundColor Gray
Write-Host "Listas para Google Play Store" -ForegroundColor Green
