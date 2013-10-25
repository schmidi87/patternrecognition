function [ x ] = fileHasCategory( filename, categories )
 x = 0;
 for i=1:size(categories)
   if cellfun('length',regexpi(filename,strcat(categories(i),'.*'))) == 1
     x=1;
   end
 end
end

