
format short g;

%The original detrend pulse signal
%fps7.4, real bpm is 96, test result is ???
org_detrend=load("examples/norm_fps7_4_1x71_6.dat");
%measured fps
FPSorg=7.4;
%total observed period T in second
Torg=max(size(org_detrend))/FPSorg;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freqorg=[0:max(size(org_detrend))-1]/Torg*60.0;
freqorg=[0:max(size(org_detrend))/2]/Torg*60.0;

figure;

%'-or' : '-' smooth line, 'o' circle sign, 'r' red line
plot(org_detrend, ':or', "linewidth", 2);
grid on
grid minor

title('original detrend @fps7.4, real:96bpm and quadratic interpolation @fps7.6, real:96bpm, exp:93bpm');
xlabel('n');
ylabel('y');

#
%detrend and then quadratic interpolation pulse signal
%fps7.6, real bpm is 96, test result is 93bpm
quadratic=load("examples/normq_real96bpm_exp93_fps7_6_6.t");

%new fps after quadratic interpolation
FPSquad=7.6;
%total observed period T in second
Tquad=max(size(quadratic))/FPSquad;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freq_quad=[0:max(size(quadratic))-1]/Tquad*60.0;
freq_quad=[0: max(size(quadratic))/2]/Tquad*60.0;

%figure;
%hold on to plot multiple sets of data within the same figure
hold on
%title('quadratic interpolation @fps7.6, real:96bpm, exp:93bpm');
%'-+g' : '-' smooth line, '+' plus sign, 'g' green line
plot(quadratic, '-+g',"linewidth", 3);

%xlabel('n');
%ylabel('y');
[h_legend,objh,outh,outm] = legend('original detrend', 'detrend and quadratic interpolation');
%set larger legend font size
set(objh,'linewidth',30);
%set(h_legend,'FontSize',14);

%%%FFT
%orignal detrend
amp_org = fft(org_detrend);
%".^2" is the element-wise power of 2, each element is powered of 2
pows_org = abs(amp_org).^2 ;
powsize = max(size(pows_org))/2;
%
samp = fftshift(amp_org);
spows=abs(samp).^2 ;
%
%figure;
%plot(freq, spows(:,1));
%title('R whitened fftshift spec @fps25');

figure;
fs=max(size(freqorg));
plot(freqorg, pows_org(1:fs),':or',"linewidth", 4);
grid on
grid minor

xlabel('bpm');
ylabel('magnitude');

title('original detrend/quadratic interpolation FFT');

%quadratic interpolation
amp_quad = fft(quadratic);
%".^2" is the element-wise power of 2, each element is powered of 2
pows_quad = abs(amp_quad).^2 ;
powsize = max(size(pows_quad))/2;
%
samp = fftshift(amp_quad);
spows=abs(samp).^2 ;
%
%figure;
%plot(freq, spows(:,1));
%title('R whitened fftshift spec @fps25');

%figure;
hold on
fqs=max(size(freq_quad));
plot(freq_quad, pows_quad(1:fqs),'-+g',"linewidth", 4);
%title('quadratic interpolation');
%xlabel('bpm');
%ylabel('magnitude');
[h_legend,objh,outh,outm] = legend('original detrend', 'detrend and quadratic interpolation');
%set larger legend font size
set(objh,'linewidth',30);
