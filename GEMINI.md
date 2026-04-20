# GEMINI.md

This file provides guidance to GEMINI Code (GEMINI.ai/code) when working with code in this repository.

## Proyecto

ADAPTA es una aplicación Flutter multiplataforma para el diseño de actividades educativas interactivas en paneles táctiles activos, dirigida a educadores de primaria, secundaria y formación profesional (FP).

## Comandos de desarrollo

```bash
# Ejecutar en modo desarrollo
flutter run

# Compilar por plataforma
flutter build android
flutter build ios
flutter build web
flutter build linux
flutter build windows
flutter build macos

# Análisis estático / lint
flutter analyze

# Tests
flutter test
```

## Arquitectura

### State Management

Se usa el patrón **Provider** (`ChangeNotifier`). Los providers están registrados en `MultiProvider` dentro de `main.dart`:

- `PainterProvider` — controla si el editor de dibujo está activo/inactivo globalmente.
- `Hamming` — gestiona la lógica del simulador de códigos Hamming (bits de datos, tipo de paridad, algoritmo).

### Navegación

Navegación tradicional con `MaterialApp.routes` definidas en `lib/router/app_routes.dart`. Se usa `Navigator.pushNamed()` directamente desde el `BuildContext`.

### Estructura de pantallas

Las pantallas están organizadas por nivel educativo bajo `lib/screens/`:

- `home_screen.dart` — menú principal en grid.
- `primaria/` — contenido de educación primaria.
- `secundaria/` — contenido de educación secundaria.
- `fp/informatica/` — módulos de FP informática (incluye simulador Hamming).
- `fp/transversales/` — módulos transversales de FP (incluye prestación por desempleo).

### Funcionalidades clave

- **Editor de dibujo** — overlay interactivo usando `scribble` + `screenshot` para capturar sobre cualquier pantalla. Controlado por `PainterProvider` y encapsulado en `PainterWidget`.
- **Visor PDF** — usa `syncfusion_flutter_pdfviewer` en `open_pdf.dart`.
- **Simulador Hamming** — lógica en `providers/hamming_provider.dart`, soporta códigos (7,4) y (15,11) con paridad par/impar.
- **Responsive layout** — detección de orientación del dispositivo para adaptar layouts entre modo tablet y móvil.

### Assets

Los assets de imagen están organizados bajo `assets/img/` por categoría (`informatica/`, `transversales/`, etc.) y declarados en `pubspec.yaml`.

## Dependencias destacadas

| Paquete | Uso |
|---|---|
| `provider` | State management |
| `scribble` | Herramienta de dibujo |
| `screenshot` | Captura de pantalla |
| `syncfusion_flutter_pdfviewer` | Visor PDF |
| `photo_view` | Zoom de imágenes |
| `file_picker` | Selección de archivos |
| `card_swiper` | Carrusel de tarjetas |
