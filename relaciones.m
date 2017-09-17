

function relacionesFaciales = relaciones (rostro)

distancias=vectorizar(rostro);

%Descomposicion en componentes del vector de distancias 
distNM=distancias(1);
distNLE=distancias(2);
distNRE=distancias(3);
distMLE=distancias(4);  
distMRE=distancias(5);
distLERE=distancias(6);
anchoNose=distancias(7);
anchoMouth=distancias(8);

%Calculo las relaciones entre las medidas calculadas

%Relacion NarizBoca - NarizOjoIzquierdo
if distNM == -1 ||distNLE == -1
relNMNLE=-1;
else    
relNMNLE=distNM/distNLE;
end

%Relacion NarizBoca - NarizOjoDerecho
if distNM == -1 ||distNRE == -1
relNMNRE=-1;
else    
relNMNRE=distNM/distNRE;
end

%Relacion NarizOjoIzquierdo - NarizOjoDerecho
if distNLE == -1 ||distNRE == -1
relNLENRE=-1;
else    
relNLENRE=distNLE/distNRE;
end

%Relacion BocaOjoIzquierdo - BocaOjoDerecho
if distMLE == -1 ||distMRE == -1
relMLEMRE=-1;
else    
relMLEMRE=distMLE/distMRE;
end

%Relacion OjoIzquierdoOjoDerecho - NarizOjoIzquierdo
if distLERE == -1 ||distNLE == -1
relLERENLE=-1;
else    
relLERENLE=distLERE/distNLE;
end

%Relacion OjoIzquierdoOjoDerecho - NarizOjoDerecho
if distLERE == -1 ||distNRE == -1
relLERENRE=-1;
else    
relLERENRE=distLERE/distNRE;
end

%Relacion anchoMouth - OjoIzquierdoOjoDerecho
if anchoMouth == -1 ||distLERE == -1
relMouthLERE=-1;
else    
relMouthLERE=anchoMouth/distLERE;
end

%Relacion anchoNose - OjoIzquierdoOjoDerecho
if anchoNose == -1 || distLERE == -1
relNoseLERE=-1;
else    
relNoseLERE=anchoNose/distLERE;
end

%Relacion anchoMouth - NarizBoca
if anchoMouth == -1 || distNM == -1
relMouthNM=-1;
else    
relMouthNM=anchoMouth/distNM;
end


%Relacion anchoNariz - NarizBoca
if anchoNose == -1 || distNM == -1
relNoseNM=-1;
else    
relNoseNM=anchoNose/distNM;
end



relacionesFaciales =[relNMNLE,relNMNRE,relNLENRE,relMLEMRE,relLERENLE,relLERENRE,relMouthLERE,relNoseLERE,relMouthNM,relNoseNM];

end