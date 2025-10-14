# CircleCI Hackathon Starter

**Rediseña el SDLC con CircleCI** - Construye una solución potenciada por IA que reimagine fundamentalmente 1-2 fases del Ciclo de Vida del Desarrollo de Software, con CircleCI como la columna vertebral de orquestación.

Este repositorio de inicio te ayuda a desplegar rápidamente tu proyecto de hackathon usando CircleCI con configuración mínima.

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

Tres configuraciones completas de despliegue en la carpeta `examples/`:

- `deploy-to-aws.yml` - Desplegar a AWS Lambda
- `deploy-to-gcp.yml` - Desplegar a Google Cloud Run  
- `deploy-to-azure.yml` - Desplegar a Azure Functions

### Scripts de Ayuda

- `scripts/setup.sh` - Valida tu configuración y muestra las variables de entorno requeridas
- `scripts/validate.sh` - Validación rápida de tu configuración de CircleCI

---

## ☁️ Cómo Elegir Tu Destino de Despliegue

Elige la plataforma en la nube que se ajuste a tu proyecto:

| Plataforma | Mejor Para | Tipo de Despliegue |
|----------|----------|-----------------|
| **AWS Lambda** | Funciones serverless, apps basadas en eventos | Función como Servicio |
| **GCP Cloud Run** | Apps en contenedores, microservicios | Contenedor como Servicio |
| **Azure Functions** | Ecosistema Azure, integración empresarial | Función como Servicio |

### Para Desplegar:

1. Copia el ejemplo de configuración a `.circleci/config.yml`:
   ```bash
   cp examples/deploy-to-aws.yml .circleci/config.yml
   ```

2. Configura las variables de entorno en CircleCI (ver siguiente sección)

3. ¡Sube a la rama `main` - el despliegue ocurre automáticamente!

---

## 🔐 Variables de Entorno que Necesitarás

Configúralas en los ajustes de tu proyecto de CircleCI (**Configuración del Proyecto → Variables de Entorno**):

### Para AWS Lambda

| Variable | Descripción | Ejemplo |
|----------|-------------|---------|
| `AWS_ACCESS_KEY_ID` | Clave de acceso AWS | `AKIAIOSFODNN7EXAMPLE` |
| `AWS_SECRET_ACCESS_KEY` | Clave secreta AWS | `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` |
| `AWS_LAMBDA_FUNCTION_NAME` | Nombre de la función Lambda | `my-hackathon-app` |
| `AWS_REGION` | Región de AWS | `us-east-1` |

### Para GCP Cloud Run

| Variable | Descripción | Ejemplo |
|----------|-------------|---------|
| `GCP_PROJECT_ID` | ID del proyecto GCP | `my-project-12345` |
| `GCP_REGION` | Región GCP | `us-central1` |
| `GCP_SERVICE_ACCOUNT_KEY` | JSON de cuenta de servicio codificado en Base64 | `eyJ0eXBlIjoi...` |

### Para Azure Functions

| Variable | Descripción | Ejemplo |
|----------|-------------|---------|
| `AZURE_FUNCTION_APP_NAME` | Nombre de la app de función | `my-hackathon-func` |
| `AZURE_RESOURCE_GROUP` | Grupo de recursos | `hackathon-rg` |
| `AZURE_SP_APP_ID` | ID de app del service principal | `12345678-1234-1234-1234-123456789012` |
| `AZURE_SP_PASSWORD` | Contraseña del service principal | `your-password` |
| `AZURE_SP_TENANT` | ID del tenant de Azure | `87654321-4321-4321-4321-210987654321` |

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

Antes de enviar tu proyecto:

1. **Agrega una insignia de CircleCI** a tu README mostrando el estado de la compilación
2. **Proporciona prueba API** del despliegue a través del endpoint de estado de CircleCI
3. **Documenta tu rediseño del SDLC** - explica cómo CircleCI orquesta tu solución

Ver `SUBMISSION_TEMPLATE.md` para el formato completo de envío.

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

Recuerda: El objetivo es **rediseñar el SDLC con CircleCI**. Piensa en:

- ¿Cómo puede CI/CD mejorar los flujos de trabajo de desarrollo?
- ¿Qué procesos manuales se pueden automatizar?
- ¿Cómo puede CircleCI orquestar pipelines complejos de IA?
- ¿Qué nuevas fases del SDLC se habilitan con la automatización inteligente?

**¡Ahora ve y construye algo increíble!** 🚀

