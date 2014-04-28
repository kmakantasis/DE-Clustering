function cost = ObjectiveCost(data, solution, sl, c)
    cost = 0;
    for i=1:sl
        point = data(i,1:2);
        cost = cost + norm(point-c(solution(i)));
    end
end

