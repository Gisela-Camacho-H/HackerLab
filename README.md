# 🛡️ HackerLab — Misión de Campo: Activación de Credencial Digital

¡Bienvenido al repositorio oficial de **HackerLab**! Este proyecto es una aplicación interactiva desarrollada en **SwiftUI** diseñada como una experiencia gamificada/taller práctico para enseñar conceptos fundamentales de desarrollo iOS en Xcode.

Los participantes asumen el rol de "reclutas" que deben realizar modificaciones directas en el código fuente para inyectar su identidad, personalizar su avatar, elegir sus colores neón y elevar sus privilegios para activar su credencial digital.

---

## 🎯 Objetivo de la Misión

El sistema central de la App se encuentra bloqueado inicialmente. Los alumnos/reclutas deben seguir una guía paso a paso para burlar la seguridad base modificando variables clave en el archivo principal `HackerLabView.swift`.

---

## 🚀 Fases del Taller

1. **🛑 Fase 1: Prueba de Acceso (Login Inicial)**
   * Abrir el proyecto en Xcode y ejecutar el simulador de iOS.
   * Probar el acceso por defecto para confirmar la alerta de *"ACCESO DENEGADO"*.
2. **🔑 Fase 2: Obtención de Credenciales Digitales**
   * Solicitar al instructor el *Sobre de Contraseña Secreta* y memorizar la clave única.
3. **💻 Fase 3: Inyección de Identidad (Modificar Código)**
   * Localizar la variable `alias` y modificar el valor `"Agente_Cero"` por su nombre o alias de hacker real.
4. **👾 Fase 4: Personalización del Agente (Avatar y Color)**
   * Seleccionar uno de los **10 avatares oficiales** (`alien`, `cyber_cat`, `hacker_fox`, `astronaut`, `bear`, `neon_robot`, `skull`, `dragon`, `duck`, `ninja`).
   * Actualizar la variable `imageName` con el identificador del avatar elegido.
   * Elegir un color neón del tema (`.hackerGreen`, `.hackerBlue`, `.hackerPink`, `.hackerYellow`, `.hackerPurple`) y asignarlo a la variable `color`.
5. **⬆️ Fase 5: Elevación de Privilegios (Nivel de Acceso)**
   * Localizar la variable `level` y cambiar el valor inicial `Double = 0.0` por un rango de privilegio de `1.0` a `5.0` (Nivel Administrador).
6. **✅ Fase 6: Activación Final**
   * Compilar de nuevo la app en el simulador.
   * Ingresar la contraseña secreta del sobre para recibir la bienvenida oficial al sistema.

---

## 🛠️ Requisitos e Instalación

* **macOS**: Sonoma 14.0 o superior recomendado.
* **Xcode**: 15.0 o superior.
* **Lenguaje / Framework**: Swift & SwiftUI.

### Instrucciones de Clonación

```bash
git clone [https://github.com/tu-usuario/HackerLab.git](https://github.com/tu-usuario/HackerLab.git)
cd HackerLab
open HackerLab.xcodeproj
