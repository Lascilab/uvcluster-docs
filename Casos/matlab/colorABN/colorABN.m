
function colorABN()
    imagefiles = dir('imgs/*.png');      
    nfiles = length(imagefiles);
    for ii=1:nfiles
       currentfilename = imagefiles(ii).name;
       currentimage = imread(strcat('imgs/',currentfilename));
       grayimage = colortograyscale(currentimage);
       [pathstr, name, x] = fileparts(currentfilename);
       imwrite(grayimage, strcat( name, '_gray', '.png'));
    end
end

function [grayImage] = colortograyscale(inputImage)
   grayImage = rgb2gray(inputImage);
end

