figure(1), clf
x1 = [0, 0];
y1 = [0.2, 1];

x2 = [0, 0, 1];
y2 = [0.2, 0, 0];

x3 = [1, 1, 0];
y3 = [0, 1, 1];

plot (x1,y1,'g',x2,y2,'b',x3,y3,'r','LineWidth',2.5);
axis square;
legend ('G1','G2','G3')
