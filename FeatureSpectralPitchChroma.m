function [vector_pc] = FeatureSpectralPitchChroma(X, f_s)

% initialize vectors
vector_pc = zeros(12, size(X,2));

% generate filter matrix
H = GeneratePcFilters(size(X,1), f_s);

% compute pitch chroma
vector_pc = H * X.^2;

% norm pitch chroma to a sum of 1
vector_pc = vector_pc ./ repmat(sum(vector_pc,1), 12, 1);

% avoid NaN for silence frames
vector_pc (:,sum(X,1) == 0) = 0;
end

%> generate the semi-tone filters (simple averaging)
function [H] = GeneratePcFilters (iSpecLength, f_s)

% initialization at C4
frequency_mid = 261.63;
iNumOctaves = 4;

%sanity check
while (frequency_mid*2^iNumOctaves > f_s/2 )
    iNumOctaves = iNumOctaves - 1;
end

H = zeros (12, iSpecLength);

for (i = 1:12)
    afBounds  = [2^(-1/24) 2^(1/24)] * frequency_mid * 2* (iSpecLength-1)/f_s;
    for (j = 1:iNumOctaves)
       iBounds                      = [ceil(2^(j-1)*afBounds(1)) floor(2^(j-1)*afBounds(2))];
       H(i,iBounds(1):iBounds(2))   = 1/(iBounds(2)+1-iBounds(1));
    end
    % increment to next semi-tone
    frequency_mid   = frequency_mid*2^(1/12);
end   
end
