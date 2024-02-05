# **Tarea 2**
### Universidad de San Carlos de Guatemala
### Facultad de Ingeniería
### Escuela de Ciencias y Sistemas
### Sistemas Operativos 1
### Sección A

<br>

| Nombre | Carnet | 
| --- | --- |
| Jeser Emanuel Rodas Medina | 202105561 |

----

<br>

# Script

Debemos asignarle permisos al archivo 'script.sh' para que el mismo pueda ser ejecutado.

```sh
chmod 750 <nombre_script>.sh
``` 

Para ejecutar el siguiente script es necesario tener instalado el paquete `jq`.

```sh
# Instalar 'jq'

# Agregar permisos primero:
# chmod 750 <nombre_script>.sh

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
```


# Cronjob

Ejecutar para definir un cronjob que ejecute el script cada 5 minutos:

```sh
crontab -e
```

Agregamos en el archivo crontab:

```sh
*/5 * * * * /tmp/<date>/script.sh
```

Guardamos el archivo crontab.