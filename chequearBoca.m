%LR=largoRostro
%AR=altoRostro
%XB=ValorEnXDeLaBoca
%YB=ValorENYDeLaBoca

function resultado = chequearBoca(LR,AR,XB,YB)
    resultado=0;
    %El primer pixel comienza en la izquiera y va hacia la derecha
    %La boca en un rostro se ubica en la segunda columna, tomando
    % 3 columnas totales (columna media)
    AnchoCadaColumna=LR/3;
    XInicialColumnaBoca=AnchoCadaColumna;
    XFinalColumnaBoca=2*AnchoCadaColumna;
    %El primer pixel comienza desde arriba y va hacia abajo
    %La boca se ubica en la ultima fila (fila 3) dividiendo el 
    %rostro en 3 filas de arriba hacia abajo
    AlturaCadaFila=AR/3;
    YInicialFilaBoca=2*AlturaCadaFila;
    YFinalFilaBoca=3*AlturaCadaFila;
    %Chequeo de cuadrantes
    if (XInicialColumnaBoca < XB) && (XFinalColumnaBoca > XB)
        if ( YInicialFilaBoca < YB) && (YFinalFilaBoca > YB)
            resultado= 1;
        end;
    end;
end