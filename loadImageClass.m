function [ I ] = loadImageClass( classname, path )
    I = cell(20, 1);
    D = dir(path);
    j=1;
    for i=1:size(D,1)
        if D(i).isdir==0 &&  size(regexpi(D(i).name,[classname '.*.gif']),1)==1
            tmp = imread([path D(i).name]);
            tmp = im2bw (tmp, graythresh(tmp));
            tmp = bwlabel(tmp);
            I{j} = tmp;
            j = j+1;
        end
    end
end

