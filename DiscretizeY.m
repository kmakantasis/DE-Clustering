function y = DiscretizeY(y, num_classes)

y = (y-min(y)) / (max(y) - min(y));
split = 1 / num_classes;

for i=1:num_classes
    idx = find(y<i*split & y>=(i-1)*split);
    y(idx) = i;
end

end

