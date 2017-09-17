function  recortador(rutaOrigen,cantImagenes)


for i=1:cantImagenes
        direccion =strcat(rutaOrigen,int2str(i),'.jpg');
        
        A=recortarRostro(direccion);
        imwrite(A, strcat(int2str(i),'.png'),'png');
end;