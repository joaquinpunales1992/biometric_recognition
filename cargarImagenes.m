%Toma una ruta como entrada,carga todas las imagenes de la ruta, calcula
%las relaciones de cada una, y las carga en la base de datos

function  cargarImagenes(ruta,cantImagenes)
%Concexion con Base de datos en postgres
dbhost = 'localhost:5432';
dbname = 'bbddRostros';
dbuser = 'postgres';
dbpass = 'joaco';
dbdriver = 'C:\Users\Joaco\Downloads\jdk\PostgreSQLDriver\postgresql-9.2-1002.jdbc4';
dburl = sprintf('jdbc:postgresql://%s/%s',dbhost,dbname);
conn = database(dbname,dbuser,dbpass,dbdriver,dburl) ;

    for i=1:cantImagenes
        direccion =strcat(ruta,int2str(i),'.png');
        rostro = imread(direccion);
        relRostro=relaciones(rostro);
        
        for j=1:10 
            if j==1
                cadena =num2str(relRostro(j));
            else
                cadena = strcat(cadena,',',num2str(relRostro(j)));
            end
        end
        cadI=int2str(i);
            sql= strcat('INSERT INTO "relaciones" (id,relacion[1],relacion[2],relacion[3],relacion[4],relacion[5],relacion[6],relacion[7],relacion[8],relacion[9],relacion[10]) VALUES (',cadI,',',cadena,')');
            exec( conn, sql);
       
    end
    
end