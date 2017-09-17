%Esta funcion toma como entrada un vector de valores y la cantdad de
%valores mas chios que se quieren obtener, y se obtienen los n valores mas
%pequeños

function minimos = minim(vector,cantMinimos)

    for j=1:cantMinimos


        minimos(j)=vector(1);

        for i=1: length(vector)

           if  minimos(j)> vector(i)
               minimos(j)=vector(i);
           end
        end  
        pos=find(vector== minimos(j));
        vector(pos(1))=[];
        %for k=1:length(pos)
        %vector(pos(k))=[];
        %end
   end
        %PARA QUE DEVUELVE CON TODAS LAS ITERACIONES BORRAR EL ULTIMO FOR Y
        %DEJAR vector(pos(1))=[];
    
    
end





