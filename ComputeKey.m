function [cKey] = ComputeKey (input, Fs, inputWindow, iBlockLength, iHopLength)
% set default parameters if necessary
if (nargin < 5)
    iHopLength      = 2048;
end
if (nargin < 4)
    iBlockLength    = 4096;
end
if (nargin < 3 || isempty(inputWindow))
    inputWindow = hann(iBlockLength,'periodic');
end

% key names
cMajor = char ('C Maj','C# Maj','D Maj','D# Maj','E Maj','F Maj','F# Maj','G Maj','G# Maj','A Maj','A# Maj','B Maj');
cMinor = char ('c min','c# min','d min','d# min','e min','f min','f# min','g min','g# min','a min','a# min','b min');

% template pitch chroma (Krumhansl major/minor)
template_pc = [6.35 2.23 3.48 2.33 4.38 4.09 2.52 5.19 2.39 3.66 2.29 2.88
           6.33 2.68 3.52 5.38 2.60 3.53 2.54 4.75 3.98 2.69 3.34 3.17];
%normalize
template_pc = diag(1./sum(template_pc,2))*template_pc;

% compute FFT window function
if (length(inputWindow) ~= iBlockLength)
    error('window length mismatch');
end        

% pre-processing: down-mixing
if (size(input,2)> 1)
    input = mean(input,2);
end
% pre-processing: normalization (not necessary for many features)
if (size(input,2)> 1)
    input = input/max(abs(input));
end

%power spectral density
[PSD,f,t] = spectrogram(  input,inputWindow,iBlockLength-iHopLength,iBlockLength,Fs);

% magnitude spectrum
PSD = abs(PSD)*2/iBlockLength;

% instantaneous pitch chroma, calls other function
input_pc = FeatureSpectralPitchChroma(PSD, Fs);

% average pitch chroma
input_pc = mean(input_pc,2); %right channel, not left

% compute manhattan distances for major and minor
distances = zeros(2,12);
for (i = 0:11) %minimize distance with circular shift
    distances(:,i+1)    = sum(abs(repmat(input_pc',2,1)-circshift(template_pc,[0 i])),2);
end
[dist,iKeyIdx]  = min(distances,[],2);
if (dist(1) < dist(2)) %select mode based on minimum distance and tonic
    cKey    = deblank(cMajor(iKeyIdx(1),:));
else
    cKey    = deblank(cMinor(iKeyIdx(2),:));
end    
end
