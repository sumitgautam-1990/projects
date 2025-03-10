clear all;
clc;

c=3*power(10,8);
h=input('Enter the substrate thickness (in mills):');
b=2*h;
w=input('Enter the width (in mills):');
Er=input('Enter the value of dielectric constant:');
if(w/b>0.35)
    web=w/b;
end

if(w/b<=0.35)
    web = w/b- power((0.35-w/b),2);
end

vp=c/sqrt(Er);
Zo=((30*pi)/sqrt(Er))*(1/(web+0.441));

disp('The phase velocity inside the Stripline (in m/sec)=')
disp(vp);

disp('The characteristic impedance of the Stripline (in ohms)=')
disp(Zo);
