# Script para generar assets de Google Play Store
# Icono 512x512px y Feature Graphic 1024x500px

Add-Type -AssemblyName System.Drawing

$outputDir = "assets\store"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# ============================================
# 1. ICONO 512x512px
# ============================================
Write-Host "Generando icono 512x512px..." -ForegroundColor Cyan

$iconPath = "assets\icon\app_icon.png"
if (Test-Path $iconPath) {
    $sourceIcon = [System.Drawing.Image]::FromFile((Resolve-Path $iconPath))
    
    # Crear bitmap 512x512
    $icon512 = New-Object System.Drawing.Bitmap(512, 512)
    $graphics = [System.Drawing.Graphics]::FromImage($icon512)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    
    # Dibujar icono redimensionado
    $graphics.DrawImage($sourceIcon, 0, 0, 512, 512)
    
    # Guardar
    $icon512Path = "$outputDir\icon_512x512.png"
    $icon512.Save($icon512Path, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $graphics.Dispose()
    $icon512.Dispose()
    $sourceIcon.Dispose()
    
    $fileSize = [math]::Round((Get-Item $icon512Path).Length / 1KB, 2)
    Write-Host "OK Icono creado: $icon512Path" -ForegroundColor Green
    Write-Host "   Dimensiones: 512x512px | Size: $fileSize KB" -ForegroundColor Gray
} else {
    Write-Host "ERROR No se encontro app_icon.png" -ForegroundColor Red
}

# ============================================
# 2. FEATURE GRAPHIC 1024x500px
# ============================================
Write-Host "`nGenerando Feature Graphic 1024x500px..." -ForegroundColor Cyan

$width = 1024
$height = 500
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Gradiente moderno (purpura a turquesa)
$rect = New-Object System.Drawing.Rectangle(0, 0, $width, $height)
$colorStart = [System.Drawing.Color]::FromArgb(109, 91, 255)  # #6D5BFF
$colorEnd = [System.Drawing.Color]::FromArgb(70, 194, 203)    # #46C2CB
$brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $colorStart, $colorEnd, 0)
$graphics.FillRectangle($brush, $rect)

# Efecto de overlay sutil
$overlayColor = [System.Drawing.Color]::FromArgb(20, 255, 255, 255)
$overlayBrush = New-Object System.Drawing.SolidBrush($overlayColor)
$graphics.FillRectangle($overlayBrush, $rect)

# Configuracion de texto
$stringFormat = New-Object System.Drawing.StringFormat
$stringFormat.Alignment = [System.Drawing.StringAlignment]::Center
$stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Center

$white = [System.Drawing.Color]::White
$whiteBrush = New-Object System.Drawing.SolidBrush($white)

# Titulo principal
$titleFont = New-Object System.Drawing.Font("Segoe UI", 72, [System.Drawing.FontStyle]::Bold)
$titleRect = New-Object System.Drawing.Rectangle(0, 100, $width, 120)
$graphics.DrawString("AliviaDol", $titleFont, $whiteBrush, $titleRect, $stringFormat)

# Emoji decorativo
$emojiFont = New-Object System.Drawing.Font("Segoe UI Emoji", 60)
$emojiRect = New-Object System.Drawing.Rectangle(0, 240, $width, 80)
$graphics.DrawString("Natural Relief", $emojiFont, $whiteBrush, $emojiRect, $stringFormat)

# Subtitulo
$subtitleFont = New-Object System.Drawing.Font("Segoe UI", 28, [System.Drawing.FontStyle]::Regular)
$subtitleRect = New-Object System.Drawing.Rectangle(0, 340, $width, 50)
$graphics.DrawString("Alivio natural con nutricion para 15 dolencias comunes", $subtitleFont, $whiteBrush, $subtitleRect, $stringFormat)

# Guardar
$featurePath = "$outputDir\feature_graphic.png"
$bitmap.Save($featurePath, [System.Drawing.Imaging.ImageFormat]::Png)

# Limpiar recursos
$graphics.Dispose()
$bitmap.Dispose()
$brush.Dispose()
$overlayBrush.Dispose()
$whiteBrush.Dispose()
$titleFont.Dispose()
$emojiFont.Dispose()
$subtitleFont.Dispose()
$stringFormat.Dispose()

$fileSize = [math]::Round((Get-Item $featurePath).Length / 1KB, 2)
Write-Host "OK Feature Graphic creado: $featurePath" -ForegroundColor Green
Write-Host "   Dimensiones: 1024x500px | Size: $fileSize KB" -ForegroundColor Gray

Write-Host "`nAssets generados exitosamente!" -ForegroundColor Green
Write-Host "`nArchivos listos para subir a Google Play Store:" -ForegroundColor Yellow
Write-Host "   1. Icono de aplicacion: $outputDir\icon_512x512.png (512x512px)" -ForegroundColor White
Write-Host "   2. Grafico de funciones: $outputDir\feature_graphic.png (1024x500px)" -ForegroundColor White
