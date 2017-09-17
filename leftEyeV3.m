%ANDA PERFECTO PARA LAS IMAGENES ESTANDARIZADAS
%Entra como parametro el rostro (previamente recortado) y devuelve las
%coordendas del punto medio del ojo derecho.Itera para encontrar el
%ojo derecho con mejor precision.

function [xCLEFinal,yCLEFinal] = leftEyeV3(rostro)
%ancho y alto del rostro para hacer el recorte del ojo izquierdo
ancho=size(rostro,1);
alto=size(rostro,2);
%parametros para el imcrop
%REC=[0,0,ancho/2,alto/2];
%rostro2=imcrop(rostro,REC);

xCLEFinal=0;
yCLEFinal=0;

 correcto=0;
i=1;
    while correcto==0 && i<16
     RightEye = vision.CascadeObjectDetector('LeftEye','MergeThreshold',i);
     BB=step(RightEye,rostro);
     lim=size(BB,1);
     i = i+1;
        while lim > 0 && correcto==0
            xLE=BB(lim,1);        
            yLE=BB(lim,2);
            aLE=BB(lim,3);
            lLE=BB(lim,4);
            lim=lim-1;
            %Coordenadas del punto medio del ojo derecho
            xCLE=xLE+(aLE/2);
            yCLE=yLE+(lLE/2);
            if (xCLE < ancho/2) && (yCLE < alto/2) 
                xCLEFinal = xCLE;
                yCLEFinal = yCLE;
                correcto=1;
            end
        end
    end
end


