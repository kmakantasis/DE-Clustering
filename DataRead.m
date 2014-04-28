function [data, num_classes] = DataRead(filename)
    data = xlsread(filename);
    num_classes = max(data(:,3));

    for i=1:num_classes
        idx = find(data(:,3)==i);
        class_i = data(idx,1:end-1);
        plot(class_i(:,1), class_i(:,2), '*', 'color',rand(1,3)); hold on;
    end

end

