function cost = InterClusterCost(cost_matrix, solution, num_classes)

cost = 0;
for i=1:num_classes
    idx = find(solution==i);
    for j=1:length(idx)
        for l=j:length(idx)
            cost = cost + cost_matrix(idx(j),idx(l));
        end
    end
end
        
% cost = 0;
% for i=1:num_classes
%     idx = find(solution==i);
%     class_i = solution(idx, 1:2);
%     [sz, ret] = size(class_i);
%     for j=1:sz
%         point1 = class_i(j,:);
%         for l=j:sz
%             point2 = class_i(l,:);
%             cost = cost + norm(point1 - point2);
%         end
%     end
%             
% end


end

