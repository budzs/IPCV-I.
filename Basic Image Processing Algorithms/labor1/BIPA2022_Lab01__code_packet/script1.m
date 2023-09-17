img = imread('input/AlfredoBorba_TuscanLandscape.jpg');
figure(1);
imshow(img);
%Create a logical variable which tells whether the image is color
%size(img) --> size(img, 3)

isColor = size(img, 3) == 3;
% use rgb2gray() to convert the image to grayscale
if isColor
    G = rgb2gray(img);
end
figure(2);
imshow(G);

%Using imwrite(), save the grayscale image into the output folder
imwrite(G, 'output/AlfredoBorba_TuscanLandscape_GRAY.jpg')