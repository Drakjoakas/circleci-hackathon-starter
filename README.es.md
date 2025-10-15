# CircleCI Hackathon Starter

Este repositorio de inicio te ayuda a desplegar rápidamente tu proyecto de hackathon usando CircleCI con configuración mínima.

**Objetivo**: ¡Haz que tu proyecto se construya y despliegue con CircleCI! 🚀

---

## 🚀 Inicio Rápido

Pon tu proyecto en marcha en 5 minutos:

1. **Haz fork de este repositorio** a tu cuenta de GitHub
2. **Regístrate en CircleCI** en https://circleci.com/signup/ y conecta tu cuenta de GitHub
3. **Sigue tu repositorio** en CircleCI para habilitar el pipeline
4. **Sube tu código** - CircleCI ejecutará las pruebas automáticamente
5. **Elige un destino de despliegue** (opcional) - Descomenta una de las opciones de despliegue en la nube en `.circleci/config.yml`

¡Tu primera compilación debería pasar inmediatamente con la configuración predeterminada!

---

## 📦 Qué Contiene Este Repositorio

### Componentes Funcionales

- **Aplicación Flask** (`app.py`) - Una app simple "Hello World" con endpoint de verificación de salud
- **Pipeline de CircleCI** (`.circleci/config.yml`) - Preconfigurado para ejecutar pruebas automáticamente
- **Dockerfile** - Listo para despliegues en contenedores
- **Suite de Pruebas** - Validación básica que se ejecuta en cada commit

### Ejemplos de Despliegue

Cinco configuraciones de despliegue en la carpeta `examples/` - elige la que se ajuste a tu proyecto

### Scripts de Ayuda

- **`scripts/setup.sh`** - ¡Ejecuta esto PRIMERO! Revisa todo y te dice qué hacer después
- **`scripts/validate.sh`** - Verificación rápida: "¿Es válido mi archivo de config de CircleCI?"

---

## ☁️ Despliegue (Opcional)

La configuración predeterminada solo ejecuta pruebas. ¿Quieres desplegar? Tenemos dos opciones:

### ⭐ Fácil: Descomenta en la Configuración Principal

Abre `.circleci/config.yml` y descomenta UNA opción de despliegue:

**Opción 1: Google Cloud Run** (Recomendado - Nivel Gratuito)
- Mejor para hackathons con nivel gratuito generoso
- Usa el orb de CircleCI Cloud Run para despliegue fácil
- Descomenta el job `deploy-to-gcp` y la sección de workflow
- Configura variables de entorno: `GCP_PROJECT_ID`, `GCP_REGION`, `GCLOUD_SERVICE_KEY`

**Opción 2: AWS ECS** (Servicio de Contenedores)
- Popular servicio de contenedores AWS con nivel gratuito
- Descomenta el job `deploy-to-ecs` y la sección de workflow
- Configura variables de entorno: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_ACCOUNT_ID`, `AWS_REGION`, `AWS_ECS_CLUSTER`, `AWS_ECS_SERVICE`

¡Luego sube a `main` y observa cómo se despliega! 🚀

### ⭐⭐⭐ Avanzado: Copia de Ejemplos

Para despliegues avanzados, copia jobs de la carpeta `examples/` a tu configuración:

- **Docker Hub** - `examples/deploy-to-docker.yml` - Registro de contenedores más simple
- **AWS EKS** - `examples/deploy-to-aws-eks.yml` - Kubernetes en AWS
- **Azure Container Instances** - `examples/deploy-to-azure-container.yml` - Contenedores Azure

Cada archivo de ejemplo tiene instrucciones sobre cómo copiarlo a tu configuración principal.

**¿Necesitas otros servicios?** Consulta la [documentación de despliegue de CircleCI](https://circleci.com/docs/deployment-overview/).

---

## 🧪 Probando Tu Pipeline

### Validación Local

Ejecuta el script de configuración para validar tu configuración:

```bash
./scripts/setup.sh
```

O usa el validador rápido:

```bash
./scripts/validate.sh
```

### Activando Compilaciones

CircleCI se ejecuta automáticamente en:
- Cada push a cualquier rama
- Cada pull request

Para activar manualmente una compilación:
1. Ve a tu dashboard de CircleCI
2. Encuentra tu proyecto
3. Haz clic en "Trigger Pipeline"

### Ver el Estado de la Compilación

- **Dashboard de CircleCI**: https://app.circleci.com/pipelines/github/TU_USUARIO
- **Agrega una insignia** a tu README (ver `SUBMISSION_TEMPLATE.md`)

---

## 🎯 Obtener Ayuda en el Hackathon

### CDMX Tech Week - Desafío CircleCI

- **Fechas**: 21-22 de octubre, 2025
- **Ubicación**: General Prim, CDMX
- **Briefing de la Misión**: 21 de octubre a las 9:00 AM (5 minutos)
- **Mentoría en Vivo**: 21 de octubre a mediodía en Playground 2 (2 sesiones)

### ¿Necesitas Ayuda?

1. Visita el **stand de CircleCI** en General Prim
2. Asiste a una **sesión de mentoría** en Playground 2
3. Consulta la **Documentación de CircleCI**: https://circleci.com/docs/
4. Haz preguntas en el canal de Slack del hackathon

---

## 📝 Requisitos de Envío

Para tu envío del hackathon, muestra tu integración con CircleCI:

1. **Agrega una insignia de CircleCI** a tu README (¡muestra que tu build pasa!)
2. **Captura de pantalla o enlace** a tu pipeline de CircleCI
3. **Bonus**: Afronta la misión opcional - rediseña parte del SDLC con IA + CircleCI

Ver `SUBMISSION_TEMPLATE.md` para ideas.

### Premios

Premios por anunciar - ¡pueden incluir membresías de aprendizaje en línea y tarjetas de regalo!

---

## 🛠️ Personalizando para Tu Proyecto

### Reemplaza la App de Ejemplo

1. Mantén la misma estructura de archivos o agrega la tuya
2. Actualiza `requirements.txt` con tus dependencias
3. Actualiza el trabajo de prueba en `.circleci/config.yml` para ejecutar tus pruebas
4. Actualiza el Dockerfile si es necesario para tu aplicación

### Agrega Más Trabajos

Puedes agregar trabajos adicionales al pipeline de CircleCI:

```yaml
jobs:
  lint:
    docker:
      - image: cimg/python:3.11
    steps:
      - checkout
      - run: pip install flake8
      - run: flake8 .
```

Luego agrégalo al workflow:

```yaml
workflows:
  build-and-test:
    jobs:
      - lint
      - test:
          requires:
            - lint
```

---

## 📚 Recursos Adicionales

- **Documentación de CircleCI**: https://circleci.com/docs/
- **Registro de Orbs de CircleCI**: https://circleci.com/developer/orbs
- **Referencia de Configuración**: https://circleci.com/docs/configuration-reference/
- **CLI Local**: https://circleci.com/docs/local-cli/

---

## 🎉 ¿Listo para Construir?

¡Pon en marcha tu pipeline de CircleCI y luego construye tu proyecto!

**Misión de Desafío Opcional**: *"Rediseña el SDLC con CircleCI"* - Usa IA + CircleCI para reimaginar flujos de desarrollo. Ejemplos: revisión de código con IA, pruebas inteligentes, documentación automatizada, despliegues inteligentes.

**¡Ahora ve y construye algo increíble!** 🚀

