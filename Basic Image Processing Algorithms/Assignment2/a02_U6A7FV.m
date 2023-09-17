currentFolder = pwd;
myFolder = currentFolder+"\input";
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);

%1. loops through the input folder and processes each image as follows: 
Sum = zeros(4,2);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  I_og = imread(fullFileName);
  I = processor(I_og);
  % I = processor(I_og, true);
  for i =1:4
      Sum(i,1) = Sum(i,1)+I(i,1);
      Sum(i,2) = Sum(i,2)+I(i,2);
  end
end
disp("Processed " + length(jpegFiles) + " images");
for i = 1:4
        disp("Question "+ i + ":  A = " +Sum(i,1)+ "    B = "+ Sum(i,2));
end    