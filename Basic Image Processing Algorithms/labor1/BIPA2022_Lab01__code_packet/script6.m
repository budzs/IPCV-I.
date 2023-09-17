clear; close all;
I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
G = rgb2gray(I);

row = 150;
R = G(row, :);
plot(R);