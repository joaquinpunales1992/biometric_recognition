%ANDA PERFECTO PARA LAS IMAGENES ESTANDARIZADAS
%Entra como parametro el rostro (previamente recortado) y devuelve las
%coordendas del punto medio del ojo derecho.Itera para encontrar el
%ojo derecho con mejor precision.

function [xCREFinal,yCREFinal] = rightEyeV3(rostro)
%ancho y alto del rostro para hacer el recorte del ojo derecho
ancho=size(rostro,1);
alto=size(rostro,2);
%parametros para el imcrop
%REC=[ancho/2,0,ancho/2,alto/2];
%rostro2=imcrop(rostro,REC);
%ancho y alto del recorte del ojo derecho
%ancho2=size(rostro2,1);
%alto2=size(rostro2,2);
xCREFinal=0;
yCREFinal=0;
correcto=0;
i=1;
    while correcto==0 && i<16
     RightEye = vision.CascadeObjectDetector('RightEye','MergeThreshold',i);
     BB=step(RightEye,rostro);
     lim=size(BB,1);
     i = i+1;
        while lim > 0 && correcto==0
            xRE=BB(lim,1);        
            yRE=BB(lim,2);  
            aRE=BB(lim,3);
            lRE=BB(lim,4);
            lim=lim-1;
            %Coordenadas del punto medio del ojo derecho
            xCRE=xRE+(aRE/2);
            yCRE=yRE+(lRE/2);
            if (xCRE > ancho/2) && (yCRE < alto/2) 
                xCREFinal = xCRE;
                yCREFinal = yCRE;
                correcto=1;
            end
        end
    end
end


