clear;


Gsf = [-1 0 0 0;
       0 -1 0 600;
       0 0 1 300;
       0 0 0 1];
Rd = [1 0 0;0 0 -1;0 1 0];%orientation
theta = [pi/8,pi/8,0,200];
[~,P] = scara_poe(theta);
P = Gsf*[P(1) P(2) P(3) 1]';
%Point P
x = P(1);
y = P(2);
z = P(3);
Phi_norm = 0;
gama = [1;zeros(5,1)];
theta = zeros(6,1);%初始化theta（0）属于R6

while(norm(gama) >0.00001)
theta1 = theta(1);
theta2 = theta(2);
theta3 = theta(3);
theta4 = theta(4);
theta5 = theta(5);
theta6 = theta(6);

L1 = 491;
L2 = 350;
L3 = 350;
L4 = 84;

gst0 = [eye(3),transpose([0,0,L1+L2+L3+L4]);0,0,0,1]; %初始位姿
gd = [Rd,[x;y;z];0,0,0,1];
gd_inv = inv(gd);%gd_inv
omega1 = transpose([0,0,1]);
omega2 = transpose([-1,0,0]);
omega3 = transpose([-1,0,0]);
omega4 = transpose([0,0,1]);
omega5 = transpose([-1,0,0]);
omega6 = transpose([0,0,1]);

q1 = transpose([0,0,0]);%转置矩阵
q2 = transpose([0,0,L1]);
q3 = transpose([0,0,L1+L2]);
q4 = transpose([0,0,0]);
q5 = transpose([0,0,L1+L2+L3]);
q6 = transpose([0,0,0]);
%kesi
k1 = [-cross(omega1,q1);omega1];
k2 = [-cross(omega2,q2);omega2];
k3 = [-cross(omega3,q3);omega3];
k4 = [-cross(omega4,q4);omega4];
k5 = [-cross(omega5,q5);omega5];
k6 = [-cross(omega6,q6);omega6];
%g1~g6
e1 = tw2tr(omega1,q1,theta1);
e2 = tw2tr(omega2,q2,theta2);
e3 = tw2tr(omega3,q3,theta3);
e4 = tw2tr(omega4,q4,theta4);
e5 = tw2tr(omega5,q5,theta5);
e6 = tw2tr(omega6,q6,theta6);

K2 = adg(e1)*k2;
K3 = adg(e1*e2)*k3;
K4 = adg(e1*e2*e3)*k4;
K5 = adg(e1*e2*e3*e4)*k5;
K6 = adg(e1*e2*e3*e4)*k6;

J = [k1 K2 K3 K4 K5 K6];%雅克比矩阵
g = e1*e2*e3*e4*e5*e6*gst0*gd_inv;
%gama_K
gama_hat = logm(g);
gama = cancel_hat(gama_hat);

%迭代
 theta = theta - (pinv(J)* gama);% inv(J'*J)*J'  
%记录模长
Phi_norm = [Phi_norm;norm(gama)];

end
plot(1:1:size(Phi_norm)-1,Phi_norm(2:size(Phi_norm))); %从1开始，步距是1到长度减1






   








