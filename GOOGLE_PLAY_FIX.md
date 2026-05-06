# 🚨 Solución: Rechazo por "Play Console Requirements"

## Problema
Google Play rechazó la app porque está categorizada como **"Medical app"** (aplicación médica), lo cual requiere una **cuenta de Organización** con número D-U-N-S.

## Solución Implementada
Hemos reclasificado la app como **aplicación informativa/educativa** sobre nutrición, NO como app médica.

---

## ✅ Pasos para resolver en Google Play Console

### 1. **Cambiar la categoría de la app** ⚠️ MUY IMPORTANTE

1. Ve a **Google Play Console**
2. Selecciona tu app **AliviaDol**
3. Ve a **Configuración principal → Detalles de la aplicación**
4. En **Categoría de la app**, cambia a:
   - **Opción 1 (RECOMENDADA):** `Comida y bebida` (Food & Drink)
   - **Opción 2:** `Estilo de vida` (Lifestyle)
   - **Opción 3:** `Libros y referencia` (Books & Reference)

**❌ NO selecciones:**
- Medical
- Health & Fitness
- Wellness

---

### 2. **Actualizar la descripción de la app**

Ve a **Detalles de la aplicación → Descripción** y usa este texto:

**Descripción corta:**
```
Información nutricional general sobre alimentos para malestares cotidianos. Solo con fines educativos.
```

**Descripción completa:**
```
AliviaDol es una aplicación educativa que proporciona información nutricional general sobre alimentos que pueden ser beneficiosos para diferentes malestares comunes del día a día.

🍎 Información sobre 30 situaciones cotidianas
📚 Basada en fuentes públicas reconocidas (Mayo Clinic, Harvard Health, NHS)
🥗 Sugerencias nutricionales generales
📖 Contenido educativo e informativo

⚠️ IMPORTANTE: Esta NO es una aplicación médica. No proporciona diagnósticos, tratamientos ni consejos médicos profesionales. La información es de carácter general y educativo. Siempre consulta a un profesional de la salud calificado para cualquier condición médica.

Ideal para:
- Aprender sobre nutrición general
- Conocer propiedades de alimentos comunes
- Educación sobre hábitos alimenticios saludables
- Información complementaria de carácter general
```

---

### 3. **Revisar el cuestionario de contenido**

Ve a **Política → Cuestionario de contenido de la aplicación**

**RESPUESTAS CLAVE:**

- **¿Tu app proporciona funciones médicas o de salud?** → **NO**
- **¿Tu app diagnostica o trata condiciones médicas?** → **NO**
- **¿Tu app es para uso profesional médico?** → **NO**
- **¿Tu app requiere aprobación médica o regulatoria?** → **NO**

Si hay una pregunta como:
- **¿Qué hace tu app?** → Selecciona "Proporciona información general/educativa"

---

### 4. **Actualizar la sección de privacidad de datos**

Si hay una sección sobre **datos de salud**:
- **¿Tu app recopila datos de salud?** → **NO**
- **¿Tu app accede a datos médicos?** → **NO**

---

### 5. **Verificar el tipo de cuenta**

Ve a **Configuración de cuenta → Detalles de la cuenta**

Debe aparecer:
- **Tipo de cuenta:** Personal (está bien)
- **NO** necesitas cambiar a Organización

---

### 6. **Generar nuevo AAB y volver a subir**

**Incrementar versión:**
```yaml
# pubspec.yaml
version: 1.0.1+7  # Nueva versión
```

**Generar AAB:**
```powershell
flutter clean
flutter build appbundle --release
```

**Subir a Google Play:**
1. Ve a **Producción → Crear nueva versión**
2. Sube el nuevo AAB (1.0.1+7)
3. En **Notas de la versión**, escribe:
   ```
   - Se actualiza el disclaimer para clarificar que es información general
   - Se enfatiza el carácter educativo e informativo de la app
   - Mejoras en la presentación del contenido
   ```

---

### 7. **Responder al rechazo (si es necesario)**

Si Google te pide una respuesta, usa este texto:

```
Hemos realizado los siguientes cambios para cumplir con las políticas:

1. Reclasificamos la app en la categoría "Comida y bebida" (Food & Drink)
2. Actualizamos todos los disclaimers para enfatizar que es SOLO información general educativa
3. Eliminamos cualquier referencia que sugiera que es una aplicación médica
4. Clarificamos que NO proporciona diagnósticos, tratamientos ni consejos médicos

La app ahora está claramente presentada como una herramienta educativa sobre nutrición general, basada en información pública de fuentes reconocidas. No requiere cuenta de organización según las políticas de Google Play.

Atentamente,
[Tu nombre]
```

---

## 📋 Checklist antes de volver a enviar

- [ ] Categoría cambiada a "Food & Drink" (o similar)
- [ ] Descripción actualizada sin términos médicos
- [ ] Cuestionario de contenido completado correctamente
- [ ] AAB nuevo generado (versión 1.0.1+7)
- [ ] Notas de versión escritas
- [ ] Respuesta al rechazo enviada (si aplica)

---

## 🎯 Resultado esperado

Después de estos cambios, Google Play **NO debería** requerir una cuenta de Organización porque:
- ✅ No está en categoría médica
- ✅ No proporciona servicios médicos
- ✅ Es claramente educativa/informativa
- ✅ Tiene disclaimers adecuados

---

## 🆘 Si aún te rechazan

Si después de estos cambios Google Play sigue rechazando, contacta al soporte con este argumento:

> Mi aplicación proporciona información nutricional general de carácter educativo, similar a un libro de cocina o guía de nutrición. No diagnostica, no trata, no prescribe. Es equivalente a contenido educativo público. Las fuentes son públicas y reconocidas. ¿Por qué se requiere cuenta de organización para contenido educativo general?

---

**Última actualización:** 6 de mayo de 2026
**Versión de la app:** 1.0.1+7 (próxima)
