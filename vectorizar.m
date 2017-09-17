%Esta funcion toma como entrada un rostro (detectado previamente), y calcula el vector con los
%valoes de las caracteristicas propias de la imagen

function distancias = vectorizar(rostro)
%Coordenadas del punto medio de la nariz
[xN,yN,anchoNose]=noseV2(rostro);

%Coordendas del punto medio de la boca 
[xM,yM,anchoMouth]=mouthV2(rostro);

%Coordenadas del punto medio de las cejas / Ver despues si sirve evaluar esto 
%[xC,yC]=cejas(rostro);

%Coordenadas de los puntos medios de los ojos, pasandole como parametro el
%rostro recortado y los puntos medio de la nariz para tomar referencia.
%[xRE,yRE,xLE,yLE]=eyesV2(rostro,xN,yN);

%Esta es otra alternativa simple de calcular los ojos
%[xLE,yLE,xRE,yRE] = EyesSimple(rostro);


%Coordenadas del punto del ojo izquierdo (uso eyes)
[xLE,yLE]=leftEyeV3(rostro);


%Coordenadas del punto del ojo derecho (uso eyes)
[xRE,yRE]=rightEyeV3(rostro);

%--------------------------------------------------------------------------
%Distancia entre el punto medio de la boca y el punto medio de la nariz

if (xN == 0 && yN == 0) || (xM == 0 && yM == 0) 

    distNM = -1;
else
    
    distNM=dist(xN,yN,xM,yM);

end

%--------------------------------------------------------------------------

%Distancia entre el punto medio de la ceja y el punto medio de la nariz

%distNC=dist(xN,yN,xC,yC);

%Distancia entre el punto medio de la ceja y el punto medio de la boca
%distMC=dist(xC,yC,xM,yM);

%--------------------------------------------------------------------------
%Distancia entre el ojo izquierdo y el punto medio de la nariz

if (xLE == 0 && yLE == 0) || (xN == 0 && yN == 0); 

    distNLE = -1;
else
    
    distNLE=dist(xLE,yLE,xN,yN);
    
end

%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%Distancia entre el ojo derecho y el punto medio de la nariz
if (xRE == 0 && yRE == 0) || (xN == 0 && yN == 0); 

    distNRE = -1;
else
    
    distNRE=dist(xRE,yRE,xN,yN);
    
end

%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Distancia entre el ojo izquierdo y el punto medio de la boca
if (xLE == 0 && yLE == 0) || (xN == 0 && yN == 0); 

    distMLE = -1;
else
    
    distMLE=dist(xLE,yLE,xN,yN);
    
end

%--------------------------------------------------------------------------



%--------------------------------------------------------------------------
%Distancia entre el ojo derecho y el punto medio de la boca
if (xRE == 0 && yRE == 0) || (xM == 0 && yM == 0); 

    distMRE = -1;
else
    
    distMRE=dist(xRE,yRE,xM,yM);
    
end

%--------------------------------------------------------------------------

%Distancia entre ojos
if (xLE == 0 && yLE == 0) || (xRE == 0 && yRE == 0); 

    distLERE = -1;
else
    
    distLERE=dist(xLE,yLE,xRE,yRE);
    
end




%Vector con las caracteristicas propias de cada rostro
distancias=[distNM,distNLE,distNRE,distMLE,distMRE,distLERE, anchoNose, anchoMouth];


%imshow(rostro);hold on;
%plot(xRE,yRE,'or','LineWidth',2,'MarkerSize',5);
%plot(xLE,yLE,'or','LineWidth',2,'MarkerSize',5);
%plot(xN,yN,'or','LineWidth',2,'MarkerSize',5);
%plot(xM,yM,'or','LineWidth',2,'MarkerSize',5);


end