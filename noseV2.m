%Entra como parametro el rostro (previamente recortado) y devuelve las
%coordendas del punto medio de la nariz detectada.Itera para encontrar la
%boca con mejor precision.

function [xCNFinal,yCNFinal, anchoNose] = noseV2(rostro)
ancho=size(rostro,1);
alto=size(rostro,2);
xCNFinal=0;
yCNFinal=0;
anchoNose=-1;

for i= 4 : 32
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',i);
BB=step(NoseDetect,rostro);
lim=size(BB,1);
   for j = 1:lim
       
    xN=BB(j,1);
    yN=BB(j,2);
    aN=BB(j,3);
    lN=BB(j,4);

    %Coordenadas del punto medio de la nariz
    xCN=xN+(aN/2);
    yCN=yN+(lN/2);
    
       if chequearNariz(ancho,alto,xCN,yCN) == 1
            xCNFinal= xCN;
            yCNFinal=yCN;
            anchoNose=aN;
 
       end
   end
end


end