# Instrucciones de instalación y configuración

## Instalación de software

1. Instalar el SE (Netbeans jdk(SE)).
2. Instalar el EE (Netbeans-8.2-javaee-windows(Java web)).
3. **No** abrir aún NetBeans IDE 8.2 RC.

## Configuración de la base de datos

Instalar y configurar Oracle:

1. Instalar oracle 11g(setup oracle)(anotar la contraseña creada).
2. Instalar sql developer e iniciarlo.
3. Crear nueva conexión (opción conexion) en SQL Developer al XE con las siguientes credenciales:
   - Nombre de conexión: SYSTEM
   - Usuario: SYSTEM
   - Contraseña: (la que se creó al instalar oracle)

Crear un nuevo usuario en Oracle con el siguiente script (o usar el script de "crear bd en oracle.ddl"):

    CREATE USER hostaldc IDENTIFIED BY 1234
    DEFAULT TABLESPACE "USERS"
    TEMPORARY TABLESPACE "TEMP";
    grant create table to hostaldc;
    grant create trigger to hostaldc;
    GRANT CREATE SESSION TO hostaldc;
    ALTER USER hostaldc QUOTA UNLIMITED ON USERS;

Crear una nueva conexión:

- Nombre de conexión: hostaldc
- Usuario: hostaldc
- Contraseña: 1234

Luego de la conexión, ejecutar los scripts "estructura.ddl" y "inserts necesarios.ddl".

**La base de datos está lista**.

## Configuración de la aplicación

Si al ejecutar la aplicación en NetBeans, se presenta un error de listener, realizar los siguientes pasos:

1. Cambiar el puerto donde se ejecuta Glassfish: 
    - Editar el archivo `C:\Program Files\glassfish-4.1.1\glassfish\domains\domain1\config\domain.xml` y cambiar el puerto 8080 por 9090.
2. Abrir NetBeans e ir a `services` en el apartado izquierdo, desplegar `services` y eliminar `Glassfish Server`.
3. Crear de nuevo Glassfish Server con un segundo click en `servers` (add server).
    - En donde dice `browse` se debe buscar la localización de la carpeta de Glassfish manualmente y seleccionarla.
    - La dirección sería `C:\Program Files\glassfish-4.1.1` y luego dar siguiente a todo sin hacer nada más.

Una vez completados estos pasos, la aplicación debería estar lista para correr.
