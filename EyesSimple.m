function [xCLE,yCLE,xCRE,yCRE]= EyesSimple(rostro)

   RightEye = vision.CascadeObjectDetector('RightEyeCART','MergeThreshold',4);
   BB=step(RightEye,rostro);
   
            %OJO IZQUIERDO
            xLE=BB(1,1);        
            yLE=BB(1,2);
            aLE=BB(1,3);
            lLE=BB(1,4);
            %Coordenadas del punto medio del ojo izquierdo
            xCLE=xLE+(aLE/2);
            yCLE=yLE+(lLE/2);
            
            %OJO DERECHO
            xRE=BB(2,1);        
            yRE=BB(2,2);
            aRE=BB(2,3);
            lRE=BB(2,4);
            %Coordenadas del punto medio del ojo derecho
            xCRE=xRE+(aRE/2);
            yCRE=yRE+(lRE/2);
            
            imshow(rostro);
            
                    rectangle('Position',[xLE,yLE,aLE,lLE],'LineWidth',1,'LineStyle','-','EdgeColor','b');
                    rectangle('Position',[xRE,yRE,aRE,lRE],'LineWidth',1,'LineStyle','-','EdgeColor','b');
             
end