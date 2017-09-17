%OJO que cuando no tienen relaciones en comun, toma como distancia 0.

function distancia = calcularSimilitud(metricasObjConsulta, metricasObjX)
    %la distancia que usamos es la distancia eucleadiana
    i=1;
    sumDeCuadrados=0;
    contador=0;
    largoVector = length(metricasObjConsulta);
    %al ser dos vectores de igual tamaño, recorremos mientras uno se
    %termina
    while i<=length(metricasObjConsulta)
        %Chequea si las metricas de la consulta son certeras
        %Si son erroneas, tienen un valor de -1)
        if ((metricasObjConsulta(i) == -1) || (metricasObjX(i) == -1))
            contador = contador + 1;
        end
        if ((metricasObjConsulta(i) >= 0) && (metricasObjX(i) >= 0))
        %acumulamos el cuadrado de la diferencia entre caracteristicas
        sumDeCuadrados=sumDeCuadrados + ((metricasObjConsulta(i) - metricasObjX(i))^2);
        i=i+1;
        else
        i=i+1;
        end
    end
    
    if contador < (largoVector/2)
         distancia = sumDeCuadrados;
    
    else
         distancia = 10000;
    end
    %distancia =  sqrt (sumDeCuadrados);
    %esta distancia indica la simitud entre el Obj1 y Obj2 segun sus
    %metricas
end
