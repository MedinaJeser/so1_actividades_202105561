!/bin/bash

# En caso de error: detener el script
set -o errexit

# Variables no definidas.
set -o nounset

# Un pipe falla -> Todos fallan.
set -o pipefail

# Variable 'GITHUB_USER'
export GITHUB_USER=MedinaJeser

# Definicion de variables y rutas para el output.
fecha=$(date)
ruta="/tmp/$fecha"

# Crear /tmp/<fecha>/
mkdir -p "$ruta"

# -----------| Request |----------

# Request para imprimir el mensaje:
#   https://api.github.com/users/<GITHUB_USER>
# Mensaje:
#   “Hola <github_user>. User ID: <id>. Cuenta fue creada el: <created_at>.”

# Estructura:
#   - curl: Comando para realizar una petición a una API
#   - echo: Comando para mostrar el resultado; en este caso, en el .log
#   - jq:   Comando para parsear el JSON

echo "Hola $GITHUB_USER. User ID:\
    $(curl -s https://api.github.com/users/$GITHUB_USER | jq -r '.id').\
    Cuenta fue creada el: $(curl -s https://api.github.com/users/$GITHUB_USER | jq -r '.created_at')."\
    > "$ruta/saludos.log"

# -----------| Cronjob |----------

# Ejecutar para definir un cronjob que ejecute el script cada 5 minutos:
#       crontab -e
#   Agregamos en el archivo crontab:
#       */5 * * * * /tmp/<date>/script.sh

# - Guardar el archivo crontab.