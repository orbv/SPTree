%%
% calculate_split_criteria.m
% Alex Dillhoff
%%

function result = calculate_split_criteria(W_pos, W_neg, Y_pos, Y_neg)
    %%
    % calculate_split_criteria
    %
    % Calculates the split criteria based on the given splits for `weights` and
    % `labels`. The critera is defined as Eq. 4 in "Sign language recognition 
    % using sequential pattern trees" by Ong et al.
    %%

    % Calculate weight coefficient
    W_sum = sum(W_pos) + sum(W_neg);
    Z_pos = sum(W_pos) / W_sum;
    Z_neg = sum(W_neg) / W_sum;

    % Calculate histogram of splits
    F_pos = whist(Y_pos, W_pos);
    F_neg = whist(Y_neg, W_neg);
    %[F_pos, ~] = hist(Y_pos, numel(unique(Y_pos)));
    %[F_neg, ~] = hist(Y_neg, numel(unique(Y_neg)));

    %F_pos = sum(W_pos) * F_pos;
    %F_neg = sum(W_neg) * F_neg;

    %F_pos = F_pos / sum(F_pos);
    %F_neg = F_neg / sum(F_neg);

    if isnan(F_pos)
        F_pos = 0;
    end

    if isnan(F_neg)
        F_neg = 0;
    end

    result = Z_pos * (1 - sum(F_pos.^2)) + Z_neg * (1 - sum(F_neg.^2));
end
