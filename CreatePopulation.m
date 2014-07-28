function population = CreatePopulation(ps, sl, data)
    population = cell(ps, 1);
   
    min_x = min(data(:,1));
    max_x = max(data(:,1));

    min_y = min(data(:,2));
    max_y = max(data(:,2));
    
    for i = 1:ps
        r_x = (max_x-min_x).*rand(sl,1) + min_x;
        r_y = (max_y-min_y).*rand(sl,1) + min_y;
    
        p = [r_x r_y];
        
        population{i} = p;
    end
    
end

