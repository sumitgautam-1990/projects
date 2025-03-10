%Stub connection in SERIES

clear all;
clc;

R0=input('Enter the characteristic impedance of the line,RO:');
Y0=1/R0;
RL=input('\nEnter the real part of output load , RL:');
XL=input('\nEnter the imaginary part of output load , XL:');

GL=RL/(RL*RL+XL*XL);
BL=-XL/(RL*RL+XL*XL);

F=input('\nEnter the FREQUENCY , F(in GHz):');
OC=input('Select stub type(0/1) \n(0)Open circuited\n(1)Short circuited\n');

LAM=0.3/F;
A= Y0*(GL-Y0);
B=-2*BL*Y0;
C=Y0*GL-GL*GL-BL*GL;

T1=(-B+sqrt(B*B-4*A*C))/(2*A);
T2=(-B-sqrt(B*B-4*A*C))/(2*A);

D1=LAM/(2*pi)*atan(T1);
D2=LAM/(2*pi)*atan(T2);
if (D1<0)
D1=D1+ LAM/2;
end

if (D2<0)
D2=D2+ LAM/2;
end

X1=(T1*GL*GL-(Y0-BL*T1)*(BL+Y0*T1)) / (Y0*(GL*GL + power((BL+Y0*T1),2)));
X2= (T2*GL^2-(Y0-BL*T2)*(BL+Y0*T2)) / (Y0*(GL*GL + power((BL+Y0*T2),2)));

L1=(-2*OC+1)*LAM/(2*pi)*atan(power((Y0/X1),(-2*OC+1)));
L2=(-2*OC+1)*LAM/(2*pi)*atan(power((Y0/X2),(-2*OC+1)));

if (L1<0)
L1=L1+ LAM/2;
end

if (L2<0)
L2=L2+ LAM/2;
end

fprintf('D1=%d m , ',D1);
fprintf('T1=%d \n',T1);

fprintf('D2=%d m ',D2);
fprintf('T2=%d \n ',T2);

fprintf('X1=%d ohm , ',X1);
fprintf('L1=%d m\n',L1);

fprintf('X2=%d ohm ',X2);
fprintf('L2=%d m\n ',L2);
fprintf('\n ALL UNITS IN S.I. \n');