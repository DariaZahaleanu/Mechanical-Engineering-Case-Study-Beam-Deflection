%input the value of x
x=input('Enter the distance from the left end\n');
%check if the value of x is valis
while x<0
   fprintf('Reenter the value\n')
   x=input('Enter the distance from the left end\n');
end
%input the value of L
L=input('Enter the length of the beam\n');
%check if the value of L is valid and prompt the user to reenter the value,
%in case L is not valid
while L<0
    fprintf('Reenter the value of the length\n')
    L=input('Enter the length of the beam\n')
end
%take input for a
a=input('Enter the location where the load P is applied\n');
%check if the value of a is valid
while a<0
    fprintf('Reenter the value of the location\n')
    a=input('Enter the location where the load P is applied\n');
end
%take input for E
E=input ('Enter the Young modulus\n');
%check if E is valid
while E<0
     fprintf('Reenter the value of the modulus\n')
     E=input ('Enter the Young modulus\n')
end
%take input for E
I=input ('Enter the second moment of area\n');
%check if I is valid
while I<0
    fprintf('Reenter the value of the moment\n')
    I=input ('Enter the second momemnt of area\n')
end
%take input for P
P=input('Enter the load\n');
%check if P is valid
while P<0
    fprintf('Reenter the value of the load\n')
    P=input('Enter the load\n');
end
fprintf ('The vertical deflection will be calculted for the following values:\n');
fprintf('x=%f\n', x);
fprintf('L=%f\n', L);
fprintf('P=%f\n', P);
fprintf('a=%f\n', a);
fprintf('E=%f\n', E);
fprintf('I=%f\n', I);
V=0;

b=L-a;%compute b, which is the difference between L and a

if (a>=x&& x>=0)%check if x is between 0 and a
    V=(P*b/6/E/I/L)*((-(L^2)+b^2)*x+x^3);%vertical deflection formula
elseif (a<x&&x<=L)%check if x is between a and L
    V=P*b/6/E/I/L*((-L^2+b^2)*x+x^3-L/b*(x-a)^3);%vertical deflection formula
end
fprintf('The vertical deflection is %f', V)



s=0:0.001:L;%increment the distance between 0 and L with the size of the step - 0.001

for i=1:length(s)%in order to compute the volume, x and V must have the same dimension
    %I use length(s) to count the number of steps
    if (a>=s(i)&& s(i)>=0)%check if x is between 0 and a
    V(i)=(P*b/6/E/I/L)*((-(L^2)+b^2)*s(i)+s(i)^3);%vertical deflection formula
    elseif (a<s(i)&&s(i)<=L)%check if x is between a and L
    V(i)=P*b/6/E/I/L*((-L^2+b^2)*s(i)+s(i)^3-L/b*(s(i)-a)^3);%vertical deflection formula
    end
end


plot(s, V, '--rs', 'Linewidth', 1)
%the plot of the values of s and V
%'--rs' colores the plot in red
%using 'linewidth', 1 is assigned to the width of the line
xlabel('x')%x-axis is labeled with the text 'x'
ylabel('volume')%y-axis is labeled with the text 'volume'
title('Beam Deflection')%the name of the table

