# Actividad 4

### **Nombre:** Jeser Emanuel Rodas Medina  
### **Carne:** 202105561  
### **Curso y Sección:** Sistemas Operativos (A)  
### **Universidad:** Universidad de San Carlos Guatemala  

</br>

---

</br>

# Chat Básico con 'Named Pipes'
Para crear un chat básico con `Named Pipes` en Linux usando bash, se pueden seguir estos pasos:

### 1. Crear las 'Named Pipes'
Abrir dos terminales y ejecutar los siguientes comandos en cada uno para crear las tuberías con nombre:

```sh
    mkfifo /tmp/participant1_to_participant2
    mkfifo /tmp/participant2_to_participant1
```

### 2. Escribir un script para el participante #1.
Crear un script, por ejemplo `participant_A.sh`, para el primer participante con el siguiente contenido:
```sh
#!/bin/bash

trap "rm -f /tmp/pipe1; rm -f /tmp/pipe2; exit" EXIT

# participant1.sh
while true; do
    read -p "Participant 1: " message
    echo "$message" > /tmp/participant1_to_participant2
    if [ "$message" == "exit" ]; then
        break
    fi
done

```

### 3. Escribir un script para el participante #2.
Crear otro script, por ejemplo `participant_B.sh`, para el segundo participante con el siguiente contenido:

```sh
#!/bin/bash

trap "rm -f /tmp/pipe1; rm -f /tmp/pipe2; exit" EXIT

# participant2.sh
while true; do
    read -p "Participant 2: " message
    echo "$message" > participant2_to_participant1
    if [ "$message" == "exit" ]; then
        break
    fi
done

```

### 4. Ejecutar los scripts en terminales separadas.
En un terminal, ejecutar el script del participante #1:
```sh
bash participant_1.sh
```

En otro terminal, ejecutar el script del participante #2:
```sh
bash participant_2.sh
```