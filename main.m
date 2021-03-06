path = '../../MPEG7_CE-Shape-1_Part_B/';

D = dir(path);
I = cell(20, 1);
j = 1;

roundness = zeros(100,1);
compactness = zeros(100,1);
formfactor = zeros(100,1);
solidity = zeros(100,1);
extent = zeros(100,1);
euler = zeros(100,1);

color = zeros(100,3);
bat_color = [0 0 0];
bats = loadImageClass('device7',path);
apples = loadImageClass('apple',path);
forks = loadImageClass('horseshoe',path);
dogs = loadImageClass('butterfly',path);
flies = loadImageClass('pencil',path);

class = 0;
s=1;

for i=1:size(bats,1)
    stats = regionprops(bats{i},'all');
    roundness(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    compactness(class*20+i) = sqrt(roundness(class*20+i));
    formfactor(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    solidity(class*20+i) = stats(s).Solidity;
    extent(class*20+i) = stats(s).Extent;
    euler(class*20+i) = stats(s).EulerNumber;
    
    color(class*20+i,:) = [0 0 0];
end

class = 1;
for i=1:size(apples,1)
    stats = regionprops(apples{i},'all');
    roundness(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    compactness(class*20+i) = sqrt(roundness(class*20+i));
    formfactor(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    solidity(class*20+i) = stats(s).Solidity;
    extent(class*20+i) = stats(s).Extent;
    euler(class*20+i) = stats(s).EulerNumber;
    
    color(class*20+i,:) = [1 0 0];
end

class = 2;
for i=1:size(forks,1)
    stats = regionprops(forks{i},'all');
    roundness(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    compactness(class*20+i) = sqrt(roundness(class*20+i));
    formfactor(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    solidity(class*20+i) = stats(s).Solidity;
    extent(class*20+i) = stats(s).Extent;
    euler(class*20+i) = stats(s).EulerNumber;
    
    color(class*20+i,:) = [0 1 0];
end

class = 3;
for i=1:size(dogs,1)
    stats = regionprops(dogs{i},'all');
    roundness(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    compactness(class*20+i) = sqrt(roundness(class*20+i));
    formfactor(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    solidity(class*20+i) = stats(s).Solidity;
    extent(class*20+i) = stats(s).Extent;
    euler(class*20+i) = stats(s).EulerNumber;
    
    color(class*20+i,:) = [0.7 0.3 0.3];
end

class = 4;
for i=1:size(flies,1)
    stats = regionprops(flies{i},'all');
    roundness(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    compactness(class*20+i) = sqrt(roundness(class*20+i));
    formfactor(class*20+i) = 4*pi*stats(s).Area/stats(s).Perimeter^2;
    solidity(class*20+i) = stats(s).Solidity;
    extent(class*20+i) = stats(s).Extent;
    euler(class*20+i) = stats(s).EulerNumber;
    
    color(class*20+i,:) = [1 1 0];
end

figure(1)
a=subplot(3,2,1);
scatter([repmat(0,20,1);repmat(1,20,1);repmat(2,20,1);repmat(3,20,1);repmat(4,20,1)], roundness, 30, color);
title(a,'roundness')

subplot(3,2,2);
scatter([repmat(0,20,1);repmat(1,20,1);repmat(2,20,1);repmat(3,20,1);repmat(4,20,1)], compactness, 30, color);
title('compactness')

subplot(3,2,3);
scatter([repmat(0,20,1);repmat(1,20,1);repmat(2,20,1);repmat(3,20,1);repmat(4,20,1)], formfactor, 30, color);
title('formfactor')

subplot(3,2,4);
scatter([repmat(0,20,1);repmat(1,20,1);repmat(2,20,1);repmat(3,20,1);repmat(4,20,1)], solidity, 30, color);
title('solidity')

subplot(3,2,5);
scatter([repmat(0,20,1);repmat(1,20,1);repmat(2,20,1);repmat(3,20,1);repmat(4,20,1)], extent, 30, color);
title('extent')

subplot(3,2,6);
scatter([repmat(0,20,1);repmat(1,20,1);repmat(2,20,1);repmat(3,20,1);repmat(4,20,1)], euler, 30, color);
title('eulernumber')

%scatter(roundness, compactness, 30, color);



%