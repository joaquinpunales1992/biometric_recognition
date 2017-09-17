%Esta funcion toma como entrada la lista de diferencias entre la base de
%datos y la consulta (lista) y la cantidad de imagenes mas parecidas que
%quiere devolver

function resultado= encontrar(lista,cantMinim)
listaMinimos=minim(lista,cantMinim);
posiciones=[];
i=1;
j=1;
    while length(posiciones) < length(listaMinimos)
        res = find(lista == listaMinimos(j));
        for t=1:length(res)
            if length(posiciones) < length(listaMinimos)
             posiciones(i)=res(t);
             i=i+1;
            
        end    
         j=j+1;
            
        
    end
    resultado=[listaMinimos,posiciones];
end


