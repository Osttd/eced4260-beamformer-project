
load Student_data.mat
Fs = f_adc;            % Sampling frequency                    
T = 1/Fs;             % Sampling period
X = raw_data_full';
L1 = length(X);             % Length of signal
L2 = length(ind_dels);
t1 = (0:L1-1)*T;        % Time vector
t2 = (0:L2-1)*T;

figure(1)
plot(1000*t1,X)
title("Signal")
xlabel("t (milliseconds)")
ylabel("X(t)")


Y = fft(X);

figure(2)
plot(Fs/L1*(0:L1-1),abs(Y),"LineWidth",3)
title("Complex Magnitude of fft Spectrum")
xlabel("f (Hz)")
ylabel("|fft(X)|")


Fs = 300;  % Sampling Frequency

Fpass = 45;              % Passband Frequency
Fstop = 50;              % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.001;           % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

Z=X(1:length(ind_dels), 1:8)';

%G=filter(Hd, Z, 1);
G=Z;

V=X(ind_dels);

A=sum(V)/8/2048;



figure(3)
plot(1000*t2,A)
title("Signal")
xlabel("t (milliseconds)")
ylabel("X(t)")


max_ind_diff=max(ind_dels(1)-ind_dels(4));

max(raw_data_full(1, :))
min(raw_data_full(1, :))
%raw_data_bits = int2bit(raw_data_full ,16);
%raw = reshape(raw_data_bits,2048,128)

%raw_data_bits1=int2bit(raw_data_full(1, :), 16);
signals1=dec2bin(raw_data_full(1, :), 16)
signals2=dec2bin(raw_data_full(2, :), 16)
signalsarray={signals2(:, :) signals1(:, :)}

%signals_array={raw_data_bits(1) raw_data_bits(2)};
% A1 = [12 5];
% N1 = 4;
% B1 = int2bit(A1, N1)


