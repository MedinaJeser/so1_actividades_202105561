# Actividad 7

### **Nombre:** Jeser Emanuel Rodas Medina  
### **Carne:** 202105561  
### **Curso y Sección:** Sistemas Operativos (A)  
### **Universidad:** Universidad de San Carlos Guatemala  

</br>


# Completely Fair Scheduler (CFS) de Linux.

El Completely Fair Scheduler (CFS) es el planificador de procesos predeterminado en el kernel de Linux desde la versión 2.6.23. Fue diseñado para proporcionar un reparto justo de los recursos de CPU entre los procesos y ofrecer una respuesta interactiva en sistemas de múltiples tareas. 

### Caracteristicas y funcionamiento 

Algunas de sus principales características y funcionamiento son:

- **Modelo de Tiempo Virtual**: CFS utiliza un modelo de tiempo virtual para distribuir de manera equitativa el tiempo de CPU entre los procesos. Cada proceso tiene asignado un tiempo virtual que se incrementa cuando el proceso está en ejecución y se congela cuando el proceso está bloqueado o en espera.

- **Árbol de Entidades Programables**: CFS organiza los procesos en un árbol jerárquico de entidades programables. Cada entidad representa un proceso individual o un grupo de procesos. Esto permite asignar pesos relativos a cada entidad y distribuir el tiempo de CPU de acuerdo con esos pesos.

- **Programación Basada en Prioridades**: CFS utiliza un sistema de prioridades para determinar qué procesos se ejecutan primero. Los procesos con mayor prioridad tienen preferencia sobre los de menor prioridad. Sin embargo, CFS intenta ser justo y no permite que los procesos de mayor prioridad acaparen indefinidamente la CPU.

- **Planificación en Tiempo Real**: CFS admite la planificación de procesos en tiempo real, lo que garantiza que los procesos críticos reciban los recursos necesarios de CPU en el momento adecuado.

- **Equilibrio de Carga**: CFS intenta equilibrar la carga de trabajo entre los diferentes núcleos de CPU disponibles. Cuando es posible, distribuye los procesos de manera equitativa entre los núcleos para aprovechar al máximo los recursos de hardware.

- **Ajuste Dinámico**: CFS ajusta dinámicamente la distribución de tiempo de CPU en función de la actividad y las demandas de los procesos. Si un proceso está inactivo o bloqueado, su tiempo de CPU se redistribuye entre los demás procesos activos.

El objetivo principal del Completely Fair Scheduler es proporcionar un entorno de programación justo y receptivo, donde todos los procesos reciban una parte equitativa de los recursos de CPU, sin dejar de priorizar los procesos críticos y sensibles a la latencia. Además, CFS intenta aprovechar al máximo los recursos de hardware disponibles mediante el equilibrio de carga y la programación en múltiples núcleos.
