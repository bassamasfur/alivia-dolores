# Script para crear capturas de pantalla para Google Play Store
# Requisitos: PNG/JPEG, 16:9 o 9:16, entre 320-3840px, max 8MB

Add-Type -AssemblyName System.Drawing

$outputDir = "assets\store\screenshots"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Relacion de aspecto 9:16 (tipico de telefono)
# Dimensiones optimas para Google Play: 1080x1920 (Full HD)
$targetWidth = 1080
$targetHeight = 1920

Write-Host "Creando capturas de pantalla para Google Play Store..." -ForegroundColor Cyan
Write-Host "Dimension objetivo: ${targetWidth}x${targetHeight}px (9:16)" -ForegroundColor Gray

# Funcion para crear screenshot con canvas 9:16
function Create-Screenshot {
    param(
        [string]$Title,
        [string]$OutputFile,
        [scriptblock]$DrawContent
    )
    
    $bitmap = New-Object System.Drawing.Bitmap($targetWidth, $targetHeight)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias
    
    # Fondo con gradiente (colores de la app)
    $rect = New-Object System.Drawing.Rectangle(0, 0, $targetWidth, $targetHeight)
    $colorStart = [System.Drawing.Color]::FromArgb(245, 247, 250)  # Fondo claro
    $colorEnd = [System.Drawing.Color]::FromArgb(230, 235, 242)
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $colorStart, $colorEnd, 90)
    $graphics.FillRectangle($brush, $rect)
    
    # Ejecutar contenido personalizado
    & $DrawContent $graphics
    
    # Guardar
    $bitmap.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)
    
    # Limpiar
    $graphics.Dispose()
    $bitmap.Dispose()
    $brush.Dispose()
    
    $size = [math]::Round((Get-Item $OutputFile).Length / 1KB, 2)
    Write-Host "OK $Title - $size KB" -ForegroundColor Green
}

# ============================================
# SCREENSHOT 1: Pantalla de inicio con grid
# ============================================
$screenshot1 = "$outputDir\01_home_grid.png"
Create-Screenshot -Title "Screenshot 1: Home Grid" -OutputFile $screenshot1 -DrawContent {
    param($g)
    
    # Header bar
    $headerColor = [System.Drawing.Color]::FromArgb(109, 91, 255)
    $headerBrush = New-Object System.Drawing.SolidBrush($headerColor)
    $g.FillRectangle($headerBrush, 0, 0, $targetWidth, 200)
    
    # Titulo
    $titleFont = New-Object System.Drawing.Font("Segoe UI", 48, [System.Drawing.FontStyle]::Bold)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $titleFormat = New-Object System.Drawing.StringFormat
    $titleFormat.Alignment = [System.Drawing.StringAlignment]::Center
    $titleFormat.LineAlignment = [System.Drawing.StringAlignment]::Center
    $titleRectF = New-Object System.Drawing.RectangleF(0, 60, $targetWidth, 80)
    $g.DrawString("AliviaDol", $titleFont, $whiteBrush, $titleRectF, $titleFormat)
    
    # Subtitulo
    $subtitleFont = New-Object System.Drawing.Font("Segoe UI", 28)
    $subtitleRectF = New-Object System.Drawing.RectangleF(0, 140, $targetWidth, 50)
    $g.DrawString("Dolencias comunes", $subtitleFont, $whiteBrush, $subtitleRectF, $titleFormat)
    
    # Grid de dolencias (simulado con cajas)
    $cardWidth = 320
    $cardHeight = 280
    $spacing = 30
    $startX = 40
    $startY = 250
    
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
        $x = $startX + ($col * ($cardWidth + $spacing))
        $y = $startY + ($row * ($cardHeight + $spacing))
        
        # Card background
        $cardRect = New-Object System.Drawing.Rectangle($x, $y, $cardWidth, $cardHeight)
        $cardBrush = New-Object System.Drawing.SolidBrush($cardColors[$i])
        $g.FillRectangle($cardBrush, $cardRect)
        
        # Bordes redondeados (simulado con sombra suave)
        $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(220, 220, 220), 2)
        $g.DrawRectangle($pen, $cardRect)
        
        # Card icon placeholder (circular background)
        $iconSize = 100
        $iconX = $x + ($cardWidth / 2) - ($iconSize / 2)
        $iconY = $y + 70
        $iconRect = New-Object System.Drawing.Rectangle($iconX, $iconY, $iconSize, $iconSize)
        $iconBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 180))
        $g.FillEllipse($iconBrush, $iconRect)
        
        # Texto
        $textRectF = New-Object System.Drawing.RectangleF($x, $y + 170, $cardWidth, 80)
        $g.DrawString($cardTitles[$i], $cardFont, $blackBrush, $textRectF, $titleFormat)
        
        $cardBrush.Dispose()
        $iconBrush.Dispose()
        $pen.Dispose()
    }
    
    $headerBrush.Dispose()
    $titleFont.Dispose()
    $subtitleFont.Dispose()
    $whiteBrush.Dispose()
    $titleFormat.Dispose()
    $cardFont.Dispose()

    $blackBrush.Dispose()
}

# ============================================
# SCREENSHOT 2: Pantalla de detalle
# ============================================
$screenshot2 = "$outputDir\02_detail_view.png"
Create-Screenshot -Title "Screenshot 2: Detail View" -OutputFile $screenshot2 -DrawContent {
    param($g)
    
    # Header con icono grande
    $headerColor = [System.Drawing.Color]::FromArgb(109, 91, 255)
    $headerBrush = New-Object System.Drawing.SolidBrush($headerColor)
    $g.FillRectangle($headerBrush, 0, 0, $targetWidth, 300)
    
    # Icono circular grande
    $iconSize = 140
    $iconX = ($targetWidth / 2) - ($iconSize / 2)
    $iconY = 80
    $iconRect = New-Object System.Drawing.Rectangle($iconX, $iconY, $iconSize, $iconSize)
    $iconWhiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 255, 255, 200))
    $g.FillEllipse($iconWhiteBrush, $iconRect)
    
    # Titulo
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    $centerFormat = New-Object System.Drawing.StringFormat
    $centerFormat.Alignment = [System.Drawing.StringAlignment]::Center
    $centerFormat.LineAlignment = [System.Drawing.StringAlignment]::Center
    $titleFont = New-Object System.Drawing.Font("Segoe UI", 42, [System.Drawing.FontStyle]::Bold)
    $titleRectF = New-Object System.Drawing.RectangleF(0, 220, $targetWidth, 60)
    $g.DrawString("Acidez / Reflujo", $titleFont, $whiteBrush, $titleRectF, $centerFormat)
    
    # Seccion "Come mas" (verde)
    $sectionY = 350
    $sectionHeight = 400
    $greenColor = [System.Drawing.Color]::FromArgb(230, 250, 235)
    $greenBrush = New-Object System.Drawing.SolidBrush($greenColor)
    $sectionRect = New-Object System.Drawing.Rectangle(40, $sectionY, $targetWidth - 80, $sectionHeight)
    $g.FillRectangle($greenBrush, $sectionRect)
    
    # Header seccion
    $sectionHeaderFont = New-Object System.Drawing.Font("Segoe UI", 32, [System.Drawing.FontStyle]::Bold)
    $greenTextColor = [System.Drawing.Color]::FromArgb(56, 142, 60)
    $greenTextBrush = New-Object System.Drawing.SolidBrush($greenTextColor)
    $headerRectF = New-Object System.Drawing.RectangleF(60, $sectionY + 30, $targetWidth - 120, 60)
    $leftFormat = New-Object System.Drawing.StringFormat
    $leftFormat.Alignment = [System.Drawing.StringAlignment]::Near
    $g.DrawString("Come mas:", $sectionHeaderFont, $greenTextBrush, $headerRectF, $leftFormat)
    
    # Items
    $itemFont = New-Object System.Drawing.Font("Segoe UI", 24)
    $blackBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(60, 60, 60))
    $items = @("Platanos", "Avena", "Jengibre", "Papaya")
    for ($i = 0; $i -lt $items.Count; $i++) {
        $itemY = $sectionY + 120 + ($i * 60)
        $itemRectF = New-Object System.Drawing.RectangleF(80, $itemY, $targetWidth - 160, 50)
        $g.DrawString("• $($items[$i])", $itemFont, $blackBrush, $itemRectF, $leftFormat)
    }
    
    # Seccion "Evita" (rojo)
    $sectionY2 = 800
    $redColor = [System.Drawing.Color]::FromArgb(255, 235, 238)
    $redBrush = New-Object System.Drawing.SolidBrush($redColor)
    $sectionRect2 = New-Object System.Drawing.Rectangle(40, $sectionY2, $targetWidth - 80, 400)
    $g.FillRectangle($redBrush, $sectionRect2)
    
    $redTextColor = [System.Drawing.Color]::FromArgb(211, 47, 47)
    $redTextBrush = New-Object System.Drawing.SolidBrush($redTextColor)
    $headerRectF2 = New-Object System.Drawing.RectangleF(60, $sectionY2 + 30, $targetWidth - 120, 60)
    $g.DrawString("Evita:", $sectionHeaderFont, $redTextBrush, $headerRectF2, $leftFormat)
    
    $items2 = @("Cafe", "Alcohol", "Picantes", "Citricos")
    for ($i = 0; $i -lt $items2.Count; $i++) {
        $itemY = $sectionY2 + 120 + ($i * 60)
        $itemRectF = New-Object System.Drawing.RectangleF(80, $itemY, $targetWidth - 160, 50)
        $g.DrawString("• $($items2[$i])", $itemFont, $blackBrush, $itemRectF, $leftFormat)
    }
    
    # Limpiar
    $headerBrush.Dispose()
    $iconWhiteBrush.Dispose()
    $whiteBrush.Dispose()
    $centerFormat.Dispose()
    $titleFont.Dispose()
    $greenBrush.Dispose()
    $sectionHeaderFont.Dispose()
    $greenTextBrush.Dispose()
    $leftFormat.Dispose()
    $itemFont.Dispose()
    $blackBrush.Dispose()
    $redBrush.Dispose()
    $redTextBrush.Dispose()
}

Write-Host "`nCapturas de pantalla generadas exitosamente!" -ForegroundColor Green
Write-Host "Ubicacion: $outputDir" -ForegroundColor Yellow
Write-Host "Dimensiones: ${targetWidth}x${targetHeight}px (9:16)" -ForegroundColor Gray
Write-Host "Listas para subir a Google Play Store" -ForegroundColor Cyan
