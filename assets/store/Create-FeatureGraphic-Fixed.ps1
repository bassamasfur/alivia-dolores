# Crear Feature Graphic con texto centrado correctamente
Add-Type -AssemblyName System.Drawing

$width = 1024
$height = 500
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Gradiente
$rect = New-Object System.Drawing.Rectangle(0, 0, $width, $height)
$colorStart = [System.Drawing.Color]::FromArgb(109, 91, 255)
$colorEnd = [System.Drawing.Color]::FromArgb(70, 194, 203)
$brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush($rect, $colorStart, $colorEnd, 0)
$graphics.FillRectangle($brush, $rect)

# Overlay
$overlayColor = [System.Drawing.Color]::FromArgb(20, 255, 255, 255)
$overlayBrush = New-Object System.Drawing.SolidBrush($overlayColor)
$graphics.FillRectangle($overlayBrush, $rect)

# Configuracion texto centrado
$stringFormat = New-Object System.Drawing.StringFormat
$stringFormat.Alignment = [System.Drawing.StringAlignment]::Center
$stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Center

$whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)

# Titulo
$titleFont = New-Object System.Drawing.Font("Segoe UI", 72, [System.Drawing.FontStyle]::Bold)
$titleRectF = New-Object System.Drawing.RectangleF(0, 100, $width, 120)
$graphics.DrawString("AliviaDol", $titleFont, $whiteBrush, $titleRectF, $stringFormat)

# Icono decorativo
$iconFont = New-Object System.Drawing.Font("Segoe UI", 48, [System.Drawing.FontStyle]::Bold)
$iconRectF = New-Object System.Drawing.RectangleF(0, 230, $width, 80)
$graphics.DrawString("+ Natural Relief +", $iconFont, $whiteBrush, $iconRectF, $stringFormat)

# Subtitulo
$subtitleFont = New-Object System.Drawing.Font("Segoe UI", 26)
$subtitleRectF = New-Object System.Drawing.RectangleF(50, 340, 924, 100)
$graphics.DrawString("Alivio natural con nutricion para dolencias comunes", $subtitleFont, $whiteBrush, $subtitleRectF, $stringFormat)

# Guardar
$output = "assets\store\feature_graphic.png"
$bitmap.Save($output, [System.Drawing.Imaging.ImageFormat]::Png)

# Limpiar
$graphics.Dispose()
$bitmap.Dispose()
$brush.Dispose()
$overlayBrush.Dispose()
$whiteBrush.Dispose()
$titleFont.Dispose()
$iconFont.Dispose()
$subtitleFont.Dispose()
$stringFormat.Dispose()

$size = [math]::Round((Get-Item $output).Length / 1KB, 2)
Write-Host "OK Feature Graphic: 1024x500px, $size KB" -ForegroundColor Green
