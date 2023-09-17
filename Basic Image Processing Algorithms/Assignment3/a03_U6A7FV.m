% loads the image 
clear 
close all
currentFolder = pwd;
myFolder = currentFolder+"\input";
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, 'sample_19.jpg');
jpegFiles = dir(filePattern);
baseFileName = jpegFiles.name;
fullFileName = fullfile(myFolder, baseFileName);
fprintf(1, 'Now reading %s\n', fullFileName);
I_og = imread(fullFileName);

% load the assumed motion blur kernel
h = fspecial('motion',30.8, 11.5);

% 2. uses an iterative deconvolution method (Richardson-Lucy)
I_RL = RL(I_og, h);

% Figure 1 shows the degraded (original) and restored image
figure(1)
subplot(1,2,1); imshow(I_og);title('Original (degraded) image');
subplot(1,2,2); imshow(I_RL); title('Restored (R-L deconv.) image');

% plate cropped from the image 
mask = cropp(I_RL);
I_cropped = bsxfun(@times, I_RL, cast(mask, 'like', I_RL));

% Crop the image to the bounding box.
props = regionprops(mask, 'BoundingBox');
I_masked = imcrop(I_cropped, props.BoundingBox);

% 3. applies local contrast enhancement (Wallis filter)
Md = 48.13;
Dd = Md/5;
Md = Md/2;
p = 0.2;
img = WallisFilter(I_masked, Md, Dd, 5, p, 3, false);

% Figure 2 shows the result of the Wallis filtering
figure(2)
subplot(1,2,2); imshow(img);title('Wallis-filtered deconvolved) image');
subplot(1,2,1); imshow(I_RL); title('Restored (R-L deconv.) image');

% Texture samples of the Laws filtering
filePattern = fullfile(myFolder, 'train.png');
jpegFiles = dir(filePattern);
baseFileName = jpegFiles.name;
baseFileNameEmpty = jpegFiles.name;
fullFileName = fullfile(myFolder, baseFileName);
fprintf(1, 'Now reading %s\n', fullFileName);
I_train = imread(fullFileName);

% 4. identifies the regions using a texture matching algorithm (Laws filter)
VOTED = label(img, I_train);

% Figure 3 shows the segmented image
figure(3);
imagesc(VOTED); 

area = 962.11;
pixel_area = area / (size(VOTED,1) * size(VOTED,2) );

number1 = sum(VOTED==1,'all');
number2 = sum(VOTED==2,'all');
number3 = sum(VOTED==3,'all');
number4 = sum(VOTED==4,'all');

% remove back background pixel values from schnitzel
number3 = number3 -1000000;

% 7. Calculates (based on area size) the price of the food.
fries = number1 * pixel_area * (0.6/100);
salad = number2 * pixel_area * (0.77/100);
schnitzel = number3 * pixel_area * (2/100);

rice = number4 * pixel_area * (0.55/100);

disp(['Fries area:  ',num2str(number1 * pixel_area ),'cm^2, price: ',num2str(fries)]);
disp(['Salad area:  ',num2str(number2 * pixel_area ),'cm^2, price: ',num2str(salad)]);
disp(['Schnitzel area:  ',num2str(number3 * pixel_area ),'cm^2, price: ',num2str(schnitzel)]);
disp(['Rice area:  ',num2str(number4 * pixel_area ),'cm^2, price: ',num2str(rice)]);

disp(['Total price:  ', ' €', num2str(fries+salad + schnitzel+ rice)]);
