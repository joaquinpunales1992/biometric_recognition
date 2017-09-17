function  imagenRecortada=recortarRostro(A)
imagen = imread(A);
face=vision.CascadeObjectDetector('FrontalFaceCART');
BB=step(face,imagen);
    
 imagenRecortada = imcrop(imagen,BB);

end