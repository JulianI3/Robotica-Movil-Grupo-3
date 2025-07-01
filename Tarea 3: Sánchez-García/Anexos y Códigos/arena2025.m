% ARENA2025 genera un área con obstáculos de perfil circular dadas las
% posiciones de los obstáculos en una matriz C y sus radios en un vector R
clf
figure(1)
hold on
k=1.414 ;%factor de escala.
plot(k*[-1 1 1 -1 -1],k*[-1 -1 1 1 -1],'r')
CC=k*0.1*[3 -7;-5 -5;0 0;-8 6;1 6; 7 4];%centros de obstáculos
RC=k*0.1*[1 1.5 2.5 1 1.2 2];% radios de obstáculos.
t=0:pi/8:2*pi;
for i=1:length(RC)
patch(CC(i,1)+RC(i)*sin(t), CC(i,2)+RC(i)*cos(t),'r')
end
plot(k*[-.9,.9],k*[-.9,.9],'+')
text(-k*.85,-k*.9,'Inicio')
text(k*.95,k*.9,'Meta')
axis(k*[-1.2 1.2 -1.2 1.2])
axis equal
grid

