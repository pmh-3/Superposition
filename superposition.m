%superposition.m
%Lab 01, plot and add signals
%Peter Heitkemper 4-3-21

clear
clc

% signal parameters in array
amplitude = [1,.5,.75];
frequency = [10,20,7]; %Hz
phase = zeros(1,3); 
offset = [0.25,0,-.5];
color = ['r','b','g']; 

%sample rate of 100*highest signal frequency(20)
sampleRate = 20000;
nperiods  = 10;

 t = 0:(1/(sampleRate*20)):(nperiods/20);
%You will need to show me how to do this with the dot operator 
%explicit looping :(
for k = 1:3
    x(k,:) = amplitude(1,k)*cos((frequency(1,k)*t*2*pi)+phase(1,k))+ offset(1,k);
end

subplot(2,1,1)
hold on
%Plot the sinusoids 
plot(t,x(1,:),color(1,1))
plot(t,x(2,:),color(1,2))
plot(t,x(3,:),color(1,3))

xlabel('Time (s)')
ylabel('x(t)')
grid on
box on
% Plot the zero line
plot(t,(t.*0),'k')
hold off

subplot(2,1,2);
hold on
%signal addition
s = x(1,:)+x(2,:)+x(3,:);
%Plot the superpositioned signal
plot(t,s(1,:),'k')

xlabel('Time (s)')
ylabel('x(t)')
grid on
box on
% Plot the zero line
plot(t,(t.*0),'k')
hold off

%anonyumous function
rootmeansquare = @(x) sqrt(1/length(x)*(sum(abs(x).^2)));

r1 = rootmeansquare(x(1,:))
%check
realRMS1 = rms(x(1,:))

r2 = rootmeansquare(x(2,:))
r3 = rootmeansquare(x(3,:))

s = rootmeansquare(s)
%check
realRMSs = rms(s)


