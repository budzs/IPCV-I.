img = imread('input/AlfredoBorba_TuscanLandscape.jpg');
%[VER, HOR, ROT] = flip_and_rotate(IMG)
[VER, HOR, ROT] = flip_and_rotate(img);

figure(1)
subplot(1,3,1);
imshow(VER);
subplot(1,3,2);
imshow(HOR);
subplot(1,3,3);
imshow(ROT);