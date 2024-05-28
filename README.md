# Instalación manual de MySQL 8.4.0 en Windows

Este manual describe los pasos para instalar MySQL 8.4.0 de forma manual en un sistema Windows. Se asume que tiene acceso a una cuenta de administrador en el sistema.
## Descarga e instalación de MySQL

### Descargar MySQL:
* Descargue el archivo ZIP de MySQL 8.4.0 para Windows desde la página oficial de MySQL: https://dev.mysql.com/downloads/mysql/
* Extraiga el contenido del archivo ZIP descargado en un directorio de su elección, por ejemplo: `C:\MySQL`.

## Configuración de MySQL

1.  Crear archivo `my.ini`: Cree un archivo llamado `my.ini` dentro del directorio de instalación de MySQL (`C:\MySQL` en este caso). Luego agregue el siguiente contenido al archivo:

    ```ini
    [mysqld]
    basedir="C:\MySQL 8.4.0"
    datadir="C:\MySQL 8.4.0\data"
    ```
## Agregar MySQL a las variables de entorno de Windows
- Agregar carpeta `bin` de MySQL a las variables de entorno. De esa manera, será sencillo el acceso a los comandos de MySQL.

    - Abrir Propiedades del sistema: Presione `Windows + R` para abrir el cuadro de diálogo "Ejecutar". Escriba `sysdm.cpl` y presione `Enter`.

    - En la ventana `Propiedades del sistema`, haga clic en la pestaña `Opciones Avanzadas`. Luego haga clic en el botón `Variables de entorno...`.

    - En la sección `Variables del sistema`, seleccione la variable `Path` y haga clic en el botón `Editar...`.

    - Al final del valor de la variable `Path`, agregue un punto y coma (`;`) seguido de la ruta completa a la carpeta bin de MySQL. Por ejemplo:

        ```cmd
        C:\MySQL 8.4.0\bin
        ```

    - Haga clic en `Aceptar` en todas las ventanas abiertas para guardar los cambios.

Con estos pasos, habrá instalado y configurado MySQL 8.4.0 de forma manual en su sistema Windows. Recuerde que puede iniciar el servidor MySQL como servicio o desde la terminal, y que es recomendable agregar la carpeta bin a las variables de entorno para facilitar el acceso a los comandos de MySQL.
    
## Iniciar servicio de MySQL
Existen dos maneras de iniciar el servicio de MySQL0.
### Instalar Servicio de Windows:
 ```cmd
mysqld --install
 ```
**Iniciar servicio:**
 ```cmd
 net start MySQL
 ```
    
**Detener servicio:**:
 ```cmd
 net stop MySQL
 ```
    
### Intefaz desde la terminal:
    
**Iniciar MySQL:** 
    
```cmd
 mysqld --console
```
El comando inicializará MySQL para escuchar peticiones desde otros IDES o Gestores de Base de Datos. Se recomienda no cerrar la consola mientras se trabaja con MySQL.
 **Detener MySQL:** Presione `Ctrl+C` en la consola para detener el proceso de MySQL.
## Ingresar a MySQL 
   Ingresar como usuario `root` a MySQL. En este caso, la instalacion fue mediante el archivo comprimido zip de MySQL. Por lo tanto, el usuario y contraseña por defecto es `root`.
  ```powershell
   mysql u root - p
  ```


## Establecer contraseña para el usuario `root` cuando se obtiene el siguiente error:
 ``` powershell
 ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
 ```


Inicializar MySQL en modo inseguro: Abra la terminal y ejecute el siguiente comando:

```powershell
 mysqld --initialize-insecure
```

Ingresar a MySQL como `root`: Ejecute el siguiente comando para iniciar MySQL y acceder como root sin contraseña:

 ```powershell
  mysql -u root --skip-password
 ```

Una vez que se accede a la consola mysql, se debe establecer la contraseña para el usuario `root`:

  ```sql
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'contraseña-personalizada';
  ```

Para salir de MySQL escriba el comando `exit;`


Notas:

    Asegúrese de tener acceso a una cuenta de administrador en el sistema Windows para realizar la instalación.
    La ruta de instalación de MySQL puede variar según su configuración.
    Si encuentra algún error durante la instalación, consulte la documentación oficial de MySQL.
    MySQLzip trae consigo las credenciales de usuario = "root" y password="root" por defecto.
