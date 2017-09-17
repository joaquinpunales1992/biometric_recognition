%Entra como parametro el rostro (previamente recortado) y devuelve las
%coordendas del punto medio de la boca detectada.Itera para encontrar la
%boca con mejor precision.
function [xCMFinal,yCMFinal,anchoMouth] = mouthV2(rostro)
ancho=size(rostro,1);
alto=size(rostro,2);
%Para despue chequear si encontro o no una buena boca
xCMFinal=0;
yCMFinal=0;
anchoMouth=-1;

for i = 4 : 32
 MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',i);
 BB=step(MouthDetect,rostro);
 lim=size(BB,1);
    for j = 1:lim 
        %Calculo el punto medio para cada una de las filas del BB de cada
        %iteracion de precision
        xM=BB(j,1);
        yM=BB(j,2);
        aM=BB(j,3);
        lM=BB(j,4);
        xCM=xM+(aM/2);
        yCM=yM+(lM/2);
        
        if chequearBoca(ancho,alto,xCM,yCM) == 1  
        
            xCMFinal=xCM;
            yCMFinal=yCM;
            anchoMouth = aM;
            
            
        end
    end
      
end

end