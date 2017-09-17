function  resultado = consulta(rutaConsulta,cantParecidos)
relacionesAuxiliar = [];
imagenConsulta = imread(rutaConsulta);
relConsulta = relaciones(imagenConsulta);
%conexion con base de datos
dbhost = 'localhost:5432';
dbname = 'bbddRostros';
dbuser = 'postgres';
dbpass = 'joaco';
dbdriver = 'C:\Users\Joaco\Downloads\jdk\PostgreSQLDriver\postgresql-9.2-1002.jdbc4';
dburl = sprintf('jdbc:postgresql://%s/%s',dbhost,dbname);
conn = database(dbname,dbuser,dbpass,dbdriver,dburl) ;
e = exec( conn, 'SELECT relacion[1],relacion[2],relacion[3],relacion[4],relacion[5],relacion[6],relacion[7],relacion[8],relacion[9],relacion[10] FROM relaciones' );
e = fetch(e);

cantidadRostrosEnBBDD = size(e.Data,1);
for j=1:cantidadRostrosEnBBDD
    for i=1:10
        relacionesAuxiliar(i) = cell2mat( e.Data(j,i));
        
    end;

    distancia = calcularSimilitud(relacionesAuxiliar, relConsulta);
    relacionesAuxiliar=[];
    lista(j) = distancia;

end;

     [minimos]=encontrar(lista,cantParecidos);
     resultado=[lista,minimos];

    %[minimo,indice] = min(lista);
    %resultado=[lista,minimo,indice];
    %figure,imshow(rutaConsulta);
    %direccionRostro = strcat('./Sistema V2/SistemaV2_BBDD/BBDD_Destino/',int2str(indice),'.png');
    %figure,imshow(direccionRostro);
   
end


