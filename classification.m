
path = '../../MPEG7_CE-Shape-1_Part_B/';

classes = {'apple' 'bat' 'beetle' 'bird' 'brick'};
class_size = 20;
class_num = size(classes,2);

D = dir(path);
I = cell(class_size, 1);
j = 1;

% namen der features
feature_names = {'roundness' 'compactness' 'formfactor' 'solidity' 'extent' 'euler' 'minorAxis' 'majorAxis'};
features = zeros(size(feature_names,2),class_size*class_num);

class_identifier = zeros(class_num*class_size,1);

for class=0:class_num-1
    images = loadImageClass(classes{1+class},path);
    class_identifier(class*class_size+1:(class+1)*class_size) = class;
    
    for i=1:size(images,1)
        stats = regionprops(images{i},'all');
        
        features(1,class*class_size+i) = 4*pi*stats(1).Area/stats(1).Perimeter^2;
        features(2,class*class_size+i) = sqrt(features(1,class*class_size+i));
        features(3,class*class_size+i) = 4*pi*stats(1).Area/stats(1).Perimeter^2;
        features(4,class*class_size+i) = stats(1).Solidity;
        features(5,class*class_size+i) = stats(1).Extent;
        features(6,class*class_size+i) = stats(1).EulerNumber;
        features(7,class*class_size+i) = stats(1).MinorAxisLength;
        features(8,class*class_size+i) = stats(1).MajorAxisLength;

    end
end