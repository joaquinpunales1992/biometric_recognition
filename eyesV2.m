
%Toma como entrada el rostro(previamente recortado) y las coordenadas del punto medio de la nariz, en base a esto
%compara todos los ojos encontrados tanto derechos como izquierdos y se
%queda con el que tenga mas "sentido", midiendo la distancia entre cada uno
%de estos al punto medio de la nariz.
%Agrega el chequeo de ojos, cuando se evalua la condicion de distancias
%entre ojos y nariz
function [xCREfinal,yCREfinal,xCLEfinal,yCLEfinal] = eyesV2(rostro,xCN,yCN)
ancho=size(rostro,1);
alto=size(rostro,2);
%Para chequear despues si encontro buenos ojos
xCREfinal=0;
yCREfinal=0;
xCLEfinal=0;
yCLEfinal=0;
i=1;
j=1;
correcto=0;
correcto2=0;



          while (correcto==0) && (j < 16)
                LeftEye = vision.CascadeObjectDetector('LeftEyeCART','MergeThreshold',j);
                LE=step(LeftEye,rostro);
                
                j=j+1;
                limit=size(LE,1);    
                        

                        
                        while (limit) > 0 && (correcto==0)
                            xLE=LE(limit,1);
                            yLE=LE(limit,2);
                            aLE=LE(limit,3);
                            lLE=LE(limit,4);
                            limit=limit-1;
                            
                            
                            %Coordenadas del punto medio del ojo izquierdo
                            xCLE=xLE+(aLE/2);
                            yCLE=yLE+(lLE/2);

                             while (correcto2==0) && (i < 16)

                                    RightEye = vision.CascadeObjectDetector('RightEyeCART','MergeThreshold',i);
                                    RE=step(RightEye,rostro);
                                    i=i+1;
                                    limit2=size(RE,1);
                                        while (limit2) > 0 && (correcto2==0)
                                            xRE=RE(limit2,1);
                                            yRE=RE(limit2,2);
                                            aRE=RE(limit2,3);
                                            lRE=RE(limit2,4);
                                            limit2=limit2-1;



                                            %Coordenadas del ojo derecho
                                            xCRE=xRE+(aRE/2);
                                            yCRE=yRE+(lRE/2);
                                             if (dist(xCRE,yCRE,xCN,yCN) - dist(xCLE,yCLE,xCN,yCN) < 3) %&& (xCRE > (ancho/2)) && (xCLE < (ancho/2))
                                                    xCREfinal=xCRE;
                                                    yCREfinal=yCRE;
                                                    xCLEfinal=xCLE;
                                                    yCLEfinal=yCLE;
                                                    correcto=1;
                                                    correcto2=1;


                                             end
                                        end 
                                    end
                             
                                    

          end
          end
end
                
                                  
                 
       



