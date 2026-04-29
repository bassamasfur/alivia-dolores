# AliviaDol 💊

Aplicación móvil Flutter que ayuda a identificar dolencias comunes y proporciona sugerencias nutricionales para aliviarlas de forma natural.

## 📱 Características

- **15 dolencias comunes**: Desde dolor de cabeza hasta fatiga
- **Sugerencias nutricionales**: Qué alimentos consumir y cuáles evitar
- **Recetas rápidas**: Preparaciones de 5 minutos para alivio inmediato
- **Información científica**: Explicación de por qué funcionan los remedios
- **Alertas médicas**: Indicaciones de cuándo consultar a un profesional
- **Interfaz moderna**: Diseño limpio con grid visual y colores suaves

## 🎨 Características Técnicas

- **Framework**: Flutter 3.35.3
- **Arquitectura**: MVC (Model-View-Controller)
- **Gestión de estado**: Provider
- **API**: Conexión con https://alivia-dolores-api.vercel.app/dolencias
- **Diseño**: Material Design 3 con colores personalizados

## 📦 Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.5+1
  http: ^1.2.0
  cupertino_icons: ^1.0.8
```

## 🚀 Instalación

1. Clonar el repositorio:
```bash
git clone [URL_DEL_REPOSITORIO]
cd alivia_dolores
```

2. Instalar dependencias:
```bash
flutter pub get
```

3. Ejecutar la aplicación:
```bash
flutter run
```

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada
├── model/
│   └── dolor_model.dart        # Modelo de datos de dolencia
├── controller/
│   └── dolor_controller.dart   # Lógica de negocio con Provider
├── services/
│   └── dolor_service.dart      # Servicio de API
└── view/
    ├── splash_page.dart        # Pantalla de inicio
    ├── dolor_list_page.dart    # Grid de dolencias
    └── dolor_detail_page.dart  # Detalle de cada dolencia
```

## 🎯 Dolencias Incluidas

1. Dolor de cabeza tensional
2. Dolor menstrual / cólicos
3. Acidez / Reflujo
4. Dolor muscular / Post gym
5. Hinchazón abdominal / Gases
6. Dolor de garganta
7. Estreñimiento
8. Náuseas / Malestar estómago
9. Resfrío / Congestión
10. Dolor de articulaciones
11. Caña / Resaca
12. Ansiedad / Nervios en guata
13. Fatiga / Falta energía
14. Calambres nocturnos
15. Dolor de muela leve

## 🎨 Paleta de Colores

- **Principal**: #6D5BFF (Morado)
- **Secundario**: #46C2CB (Turquesa)
- **Verde positivo**: #4CAF50
- **Rojo negativo**: #EF5350
- **Naranja alerta**: #FF9800

## 📱 Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ✅ Windows
- ✅ Web
- ✅ macOS
- ✅ Linux

## 👨‍💻 Desarrollo

Este proyecto fue creado como una herramienta educativa para proporcionar información sobre remedios naturales. No reemplaza la consulta médica profesional.

## 📄 Licencia

Este proyecto es de código abierto para fines educativos.
