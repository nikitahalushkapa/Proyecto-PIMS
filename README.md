
# TRABAJO FINAL: PROYECTO INTERMODULAR
**Autor:** Nikita Halushka Pavlyuchenco
**Curso:** 1° SMR
**Ciudad:** Talavera de la Reina
**Fecha:** Mayo 2026
**Profesor:** Juan Pedro Fernández Torralbo
**Centro:** IES RIBERA DEL TAJO

---

## ÍNDICE
* PARTE 1.- INTRODUCCIÓN
  * 1.1.- INTRODUCCIÓN
* PARTE 2.- DESARROLLO DEL TRABAJO
  * 2.1.- DESARROLLO
  * 2.2.- TECNOLOGÍAS USADAS
    * 2.2.1.- RSYNC
    * 2.2.2.- VEEAM
    * 2.2.3.- RCLONE
  * 2.3.- ESTRUCTURA

---

## PARTE 1.- INTRODUCCIÓN

### 1.1.- INTRODUCCIÓN
En este trabajo, tengo la idea de diseñar e implementar un sistema de copias de seguridad automatizada para que funcione tanto en Windows y Linux. 

Para que pueda pasar esto, usaremos herramientas como Veeam Agent para WINDOWS y rsync para LINUX, los resultados de las copias se quedan en la nube como Google Drive o OneDrive gracias a rclone.

Antes de que haga esta idea, necesitaría una simulación con las maquinas virtuales con VirtualBox, esto me permitiría probar la ejecución de los backups, esto me permitirá recuperar los datos y sincronizar la nube y así podre estar tranquilo sin tener que poner en riesgo algún dato real.

---

## PARTE 2.- DESARROLLO DEL TRABAJO

### 2.1.- DESAROLLO
Para empezar con este proyecto, primero planificaría e implementar un sistema de copias de seguridad automáticas que proteja los datos de un equipo, que decide que datos guardar, que frecuencia usar, donde almacenar y como se podrían recuperar en un caso de perdida.

Tengo varias opciones para conseguir el objetivo:
* Backup en un servidor NAS local: ofrece mucho mas control, pero se pide hardware adicional y no se puede proteger a desastres físicos como robos.
* Backup manual con copia a disco externo: es sencillo, pero depende mucho del usuario ya que no garantiza la seguridad de los datos.
* Backup automatizado en la nube Veeam/rsync + rclone: este permite automatizar los procesos, garantizando cierta periocidad y protege los datos fuera del entorno físico.

La opción más fiable es la tercera opción, combinando rsync, Veeam con rclone porque son herramientas multiplataforma gratuitas y profesionales, permitiéndonos automatizar los procesos por completo de las copias de seguridad.

Gracias a la herramienta rclone, nos facilita los respaldos a Google Drive o OneDrive para cumplir la estrategia 3-2-1, mientras que el acceso por SSH nos permite una administración remota y centralizada desde cualquier equipo. Gracias a esto, podemos programar copias de seguridad automáticas, así como gestionar los servidores de manera remota gracias al SSH dentro de la red.

Además, nos permite que el negocio continue gracias a la verificación de integridad de los datos y la simulación que podemos crear ante desastres. Todo esto será digitalizado y documentando por mi para que cualquier persona pueda mantener el sistema en un futuro.

---

### 2.2.- TECNOLOGIAS USADAS
Aqui explicare las herramientas principales que destacan en el proyecto.

#### 2.2.1.- RSYNC
Es una herramienta de código abierto que sincroniza y copia los ficheros de los sistemas de LINUX y UNIX. Permitiendo copiar y sincronizar archivos de manera mas eficiente. Solamente transfiriendo datos que han cambiado respecto a la ultima copia hecha, optimizando el uso de recursos.

Para en el uso del trabajo, se usará la herramienta en la máquina virtual de Ubuntu Server para hacer copias de seguridad incrementales de los directorios y carpetas que selecciones. Se programaría usando cron para que se ejecute automáticamente y los archivos archivos que salgan como resultado, se enviaran a la nube que tiene rclone.

#### 2.2.2.- VEEAM
Herramienta que permite la solución del backup profesional diseñada para proteger ciertos equipos con el sistema operativo de Windows. Permitiendo realizar cualquier tipo de copia de seguridad y de carpetas o volúmenes concretos, ofreciendo una interfaz sencilla.

La herramienta será usada para instalar una versión de Windows, 10-11 para que se programan copias automáticas de carpetas de cada usuario y configuraciones del sistema. Estas copias se almacenarán de manera local y se podrán sincronizar en la nube gracias a rclone.

#### 2.2.3.- RCLONE
Es una herramienta de comandos de multiplataforma que permite sincronizar archivos y directorios con una gran variedad de servicios de almacenamiento en la nube, como Google drive, OneDrive y Dropbox. Funcionando tanto en Windows como Linux y se integra sin ningún problema en otros sistemas de backup.

La herramienta será usada para hacer un puente entras las copias generadas por las 2 herramientas anteriormente mencionadas y el almacenamiento en la nube. Se puede configurar para subir automáticamente los backups a Google Drive o OneDrive.

---

### 2.3.- ESTRUCTURA

```text
Trabajo_Final_Nikita_Halushka/
├── Primera_entrega_proyecto_Nikita_Halushka
├── README.md
├── Docs/
├── Scripts/
│   ├── Backup_linux.sh
│   └── Sync_clouud.sh
└── Logs/
    ├── Backup.log
    └── Rclone.log
