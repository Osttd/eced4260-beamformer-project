
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


Z=X(1:length(ind_dels), 1:8)';

W=Z(ind_dels);

A=sum(W);

figure(3)
plot(1000*t2,A)
title("Signal")
xlabel("t (milliseconds)")
ylabel("X(t)")

