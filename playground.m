%take in songs
[X1, Fs1] = audioread('song1.mp3');
[X2, Fs2] = audioread('song2.mp3');
[X3, Fs3] = audioread('song3.mp3');



%compute 12x2 vector of features
vfc1 = FeatureSpectralPitchChroma(X1, Fs1);
vfc2 = FeatureSpectralPitchChroma(X2, Fs2);
vfc3 = FeatureSpectralPitchChroma(X3, Fs3);

%plot features
subplot(3,1,1)
plot(vfc1)
title('Song 1, left and right channels vs. note')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'D#','E','F','F#','G','G#','A','A#','B','C','D'})
legend('Left Channel','Right Channel')
subplot(3,1,2)
plot(vfc2)
title('Song 2, left and right channels vs. note')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'D#','E','F','F#','G','G#','A','A#','B','C','D'})
legend('Left Channel','Right Channel')
subplot(3,1,3)
plot(vfc3)
title('Song 3, left and right channels vs. note')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'D#','E','F','F#','G','G#','A','A#','B','C','D'})
legend('Left Channel','Right Channel')

%compute keys
ans1 = ComputeKey(X1,Fs1);
ans2 = ComputeKey(X2,Fs2);
ans3 = ComputeKey(X3,Fs3);

%view template
t_pc = [6.35 2.23 3.48 2.33 4.38 4.09 2.52 5.19 2.39 3.66 2.29 2.88
               6.33 2.68 3.52 5.38 2.60 3.53 2.54 4.75 3.98 2.69 3.34 3.17];
t_pc = diag(1./sum(t_pc,2))*t_pc;
t_pc = transpose(t_pc);

%view profiles
figure;
subplot(2,1,1)
plot(t_pc(:,1)) 
title('C Major KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B','C','D'})
subplot(2,1,2)
plot(t_pc(:,2))  
title('C Minor KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B'})