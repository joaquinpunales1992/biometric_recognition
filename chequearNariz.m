%LR=largoRostro
%AR=altoRostro
%XN=ValorEnXDeNariz
%YN=ValorENYDeNariz

function resultado=chequearNariz(LR,AR,XN,YN)
    resultado = 0;
    %El primer pixel comienza en la izquiera y va hacia la derecha
    %La nariz en un rostro se ubica en la tercer columna, tomando
    % 5columnas totales (columna media)
    AnchoCadaColumna=LR/5;
    XInicialColumnaNariz=2*AnchoCadaColumna;
    XFinalColumnaNariz=3*AnchoCadaColumna;
    %El primer pixel comienza desde arriba y va hacia abajo
    %La nariz se ubica en la tercer fila dividiendo el rostro en 4 filas
    AlturaCadaFila=AR/4;
    YInicialFilaNariz=2*AlturaCadaFila;
    YFinalFilaNariz=3*AlturaCadaFila;
    %Chequeo de cuadrantes para nariz
    if (XInicialColumnaNariz<XN) && (XFinalColumnaNariz>XN)
        if (YInicialFilaNariz<YN) && (YFinalFilaNariz>YN)
            resultado= 1;
        end;
    end;
end

