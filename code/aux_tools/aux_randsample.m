%% FUNCTION THAT PERFORMS RANDSAMPLE SEVERAL TIMES

function out = aux_randsample(sample,k,times)

for i = 1:times
    out(i,:) = randsample(sample,k);
end

end