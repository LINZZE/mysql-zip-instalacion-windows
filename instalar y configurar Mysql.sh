#descargar mysql zip desde su pagina oficial
    https://dev.mysql.com/downloads/mysql/

# extraer el zip en el disco C:
    "C:\MySQL"

# dentro del directorio MySQl creamos un archivo my.ini con los siguientes datos:
    [mysqld]
    # establecer la direccion de la carpeta de mysql
    basedir="C:\MySQL 8.4.0"
    # establecer la carpeta que contendra los datos que se generaran al inicializar MySQl por primera vez
    # Nota: la carpeta mydata debe existir, la carpeta data sera generada de forma automatica
    datadir="C:\MySQL 8.4.0\mydata\data"

# si no se ha configurado el contraseña para el usuario root entonces realizar lo siguiente
# esto aplica para errores del tipo -> ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
# todos los comandos se ejecutan en cmd o terminal
    # inicializar mysql en modo inseguro para configurar el contraseña del administrador (root)
    mysqld  --initialize-insecure

    # entrar a mysql como root sin contraseña
    mysql -u root --skip-password

    # usar el comando ALTER USER para asignar una nueva contraseña para el usuario root
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'contraseña-personalizada';

# INICIANDO EL SERVIDOR
    # existen dos formas de inicializar mysql

    # inicilizandolo como servicio de windows   que posteriormente requerira de una gestor de base de datos
    net start MySQL # iniciar servicio
    net stop MySQL # detener servicio

    # inicializandolo directamente desde la terminal y desde alli ejecutar las consultas
    mysqld --console


# Se recomienda que la carpeta bin de mysql se debe asignar en las variables de entorno de windows para una mejor experiencia