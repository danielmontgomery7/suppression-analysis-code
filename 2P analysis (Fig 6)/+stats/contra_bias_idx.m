function CBI = contra_bias_idx(ODIs)


nbins = 7;

edges = linspace(-1, 1, nbins+1);
N = nan(1, nbins);
for ii = 1:nbins
    N(ii) = sum(ODIs >= edges(ii) & ODIs <= edges(ii+1));
end



Ntot = sum(N);

% CBI = ((N(5)-N(1)) + (N(4)-N(2)) + Ntot) / (2*Ntot); % 5 bins

CBI = ((N(7)-N(1)) + (N(6)-N(2)) + (N(5)-N(3)) + Ntot) / (2*Ntot); % 7 bins


















