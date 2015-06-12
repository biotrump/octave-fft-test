
format short g;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elapsed since the first frame in ms unit
time_elapsed6=load("examples/0612/time_elapsed_6.y");
elapsed6_size = max(size(time_elapsed6));
time_elapsed6_equi=[0:elapsed6_size-1].*(time_elapsed6(end)/elapsed6_size);
org6=load("examples/0612/norm_fps7_5_1x71_6.y");
rinter6=load("examples/0612/normq_fps7_6_6.y");

figure;
%'-or' : '-' smooth line, 'o' circle sign, 'r' red line
plot(time_elapsed6, org6, ':or', "linewidth", 2);
grid on
grid minor

xlabel('100ms');
ylabel('y');
title('org6');

hold on
plot(time_elapsed6_equi, rinter6, '-+g',"linewidth", 3);

%measured fps
FPSorg=7.6;
%total observed period T in second
Torg=max(size(org6))/FPSorg;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freqorg=[0:max(size(org3))-1]/Torg*60.0;
freqorg=[0:max(size(org6))/2]/Torg*60.0;

%new fps after quadratic interpolation
FPSquad=7.7;
%total observed period T in second
Tquad=max(size(rinter6))/FPSquad;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freq_quad=[0:max(size(quadratic))-1]/Tquad*60.0;
freq_quad=[0: max(size(rinter6))/2]/Tquad*60.0;

%%%FFT
figure;
xlabel('bpm');
ylabel('magnitude');

%orignal detrend
amp_org = fft(org6);
%".^2" is the element-wise power of 2, each element is powered of 2
pows_org = abs(amp_org).^2 ;
powsize = max(size(pows_org))/2;
%
samp = fftshift(amp_org);
spows=abs(samp).^2 ;

fs=max(size(freqorg));
plot(freqorg, pows_org(1:fs),':or',"linewidth", 4);
grid on
grid minor

xlabel('bpm');
ylabel('magnitude');

title('original6 detrend/quadratic interpolation FFT');

%rinter interpolation
amp_quad = fft(rinter6);
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
%title('rinter interpolation');
%xlabel('bpm');
%ylabel('magnitude');
[h_legend,objh,outh,outm] = legend('original detrend', 'detrend and rinter interpolation');
%set larger legend font size
set(objh,'linewidth',30);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elapsed since the first frame in ms unit
time_elapsed7=load("examples/0612/time_elapsed_7.y");
elapsed7_size = max(size(time_elapsed7));
time_elapsed7_equi=[0:elapsed7_size-1].*(time_elapsed7(end)/elapsed7_size);
org7=load("examples/0612/norm_fps7_6_1x30_7.y");
rinter7=load("examples/0612/normq_fps7_7_7.y");

figure;
%'-or' : '-' smooth line, 'o' circle sign, 'r' red line
plot(time_elapsed7, org7, ':or', "linewidth", 2);
grid on
grid minor

xlabel('100ms');
ylabel('y');

hold on
plot(time_elapsed7_equi, rinter7, '-+g',"linewidth", 3);
title('org7');

%measured fps
FPSorg=7.6;
%total observed period T in second
Torg=max(size(org7))/FPSorg;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freqorg=[0:max(size(org3))-1]/Torg*60.0;
freqorg=[0:max(size(org7))/2]/Torg*60.0;

%new fps after quadratic interpolation
FPSquad=7.7;
%total observed period T in second
Tquad=max(size(rinter7))/FPSquad;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freq_quad=[0:max(size(quadratic))-1]/Tquad*60.0;
freq_quad=[0: max(size(rinter7))/2]/Tquad*60.0;

%%%FFT
figure;
xlabel('bpm');
ylabel('magnitude');

%orignal detrend
amp_org = fft(org7);
%".^2" is the element-wise power of 2, each element is powered of 2
pows_org = abs(amp_org).^2 ;
powsize = max(size(pows_org))/2;
%
samp = fftshift(amp_org);
spows=abs(samp).^2 ;

fs=max(size(freqorg));
plot(freqorg, pows_org(1:fs),':or',"linewidth", 4);
grid on
grid minor

xlabel('bpm');
ylabel('magnitude');

title('original detrend/quadratic interpolation FFT');

%rinter interpolation
amp_quad = fft(rinter7);
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
%title('rinter interpolation');
%xlabel('bpm');
%ylabel('magnitude');
[h_legend,objh,outh,outm] = legend('original detrend', 'detrend and rinter interpolation');
%set larger legend font size
set(objh,'linewidth',30);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%elapsed since the first frame in ms unit
time_elapsed11=load("examples/0612/time_elapsed_11.y");
elapsed11_size = max(size(time_elapsed11));
time_elapsed11_equi=[0:elapsed11_size-1].*(time_elapsed11(end)/elapsed11_size);
org11=load("examples/0612/norm_fps7_6_1x58_11.y");
rinter11=load("examples/0612/normq_fps7_6_11.y");

figure;
%'-or' : '-' smooth line, 'o' circle sign, 'r' red line
plot(time_elapsed11, org11, ':or', "linewidth", 2);
grid on
grid minor

xlabel('100ms');
ylabel('y');

hold on
plot(time_elapsed11_equi, rinter11, '-+g',"linewidth", 3);
title('org11');

%measured fps
FPSorg=7.6;
%total observed period T in second
Torg=max(size(org11))/FPSorg;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freqorg=[0:max(size(org3))-1]/Torg*60.0;
freqorg=[0:max(size(org11))/2]/Torg*60.0;

%new fps after quadratic interpolation
FPSquad=7.6;
%total observed period T in second
Tquad=max(size(rinter11))/FPSquad;
%bpm list by multiple * delta_freq * 60bpm
%Since we have only real signal, so the fft only the first half is useful.
%the second half of fft is mirrored of the first half.
%freq_quad=[0:max(size(quadratic))-1]/Tquad*60.0;
freq_quad=[0: max(size(rinter11))/2]/Tquad*60.0;

%%%FFT
figure;
xlabel('bpm');
ylabel('magnitude');

%orignal detrend
amp_org = fft(org11);
%".^2" is the element-wise power of 2, each element is powered of 2
pows_org = abs(amp_org).^2 ;
powsize = max(size(pows_org))/2;
%
samp = fftshift(amp_org);
spows=abs(samp).^2 ;

fs=max(size(freqorg));
plot(freqorg, pows_org(1:fs),':or',"linewidth", 4);
grid on
grid minor

xlabel('bpm');
ylabel('magnitude');

title('original detrend/quadratic interpolation FFT');

%rinter interpolation
amp_quad = fft(rinter11);
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
%title('rinter interpolation');
%xlabel('bpm');
%ylabel('magnitude');
[h_legend,objh,outh,outm] = legend('original detrend', 'detrend and rinter interpolation');
%set larger legend font size
set(objh,'linewidth',30);