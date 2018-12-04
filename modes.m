t_d = [6.31 2.23 3.48 2.33 4.38 4.09 2.52 5.19 2.39 3.66 2.29 2.88
               6.33 2.68 3.52 5.38 2.60 3.53 2.54 4.65 3.98 2.69 3.34 3.17];
t_d = diag(1./sum(t_d,2))*t_d;
t_d = transpose(t_d);

t_p = [6.35 2.23 3.48 2.33 4.58 4.09 2.52 5.19 2.39 3.7 2.29 2.88
               6.13 3.52 5.38 2.63 3.50 2.54 4.55 3.98 2.80 3.34 3.17 2.68 ];
t_p = diag(1./sum(t_p,2))*t_p;
t_p = transpose(t_p);

t_l = [6.35  3.48 2.23 4.38 2.33 4.09 2.52 5.19 2.39 3.66 2.29 2.88
               6.43 2.54 4.75 3.98 2.69 3.34 3.17 2.68 3.52 5.38 2.60 3.53 ];
t_l = diag(1./sum(t_l,2))*t_l;
t_l = transpose(t_l);

t_m = [6.65 2.23 3.48 2.33 4.38 4.29 2.52 5.19 2.39 3.76 2.88 2.29
               6.47 2.68 2.69 3.34 3.17 3.52 5.38 2.60 3.53 2.54 4.75 3.98 ];
t_m = diag(1./sum(t_m,2))*t_m;
t_m = transpose(t_m);

t_lo = [6.45 4.09 2.52 5.19 2.39 3.66 2.29 2.88 2.23 3.48 2.33 4.38
               6.23 2.68 3.52 2.60 3.53 2.54 4.75 5.38 3.98 2.69 3.34 3.17];
t_lo = diag(1./sum(t_lo,2))*t_lo;
t_lo = transpose(t_lo);

figure;
subplot(2,1,1)
plot(t_d(:,1))
title('C Dorian KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B','C','D'})
subplot(2,1,2)
plot(t_l(:,1))
title('C Phrygian KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B','C','D'})
figure;
subplot(2,1,1)
plot(t_p(:,1))
title('C Lydian KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B','C','D'})
subplot(2,1,2)
plot(t_m(:,1))
title('C Mixolydian KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B','C','D'})
figure;
plot(t_lo(:,1))
title('C Locrian KK-profile')
axis([1 12 1 inf])
ylim([0 .2])
xticklabels({'C','D','D#','E','F','F#','G','G#','A','A#','B','C','D'})