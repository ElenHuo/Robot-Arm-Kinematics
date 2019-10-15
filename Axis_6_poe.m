function [ R,P ] = Axis_6_poe( theta ) %tool frame is ZYZ   Line straight of the initial orientation
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明


theta1=theta(1);
theta2=theta(2);
theta3=theta(3);
theta4=theta(4);
theta5=theta(5);
theta6=theta(6);

L1 = 491;
L2 = 350;
L3 = 350;
L4 = 84;

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

e1 = tw2tr(omega1,q1,theta1);
e2 = tw2tr(omega2,q2,theta2);
e3 = tw2tr(omega3,q3,theta3);
e4 = tw2tr(omega4,q4,theta4);
e5 = tw2tr(omega5,q5,theta5);
e6 = tw2tr(omega6,q6,theta6);

gst0 = [eye(3),transpose([0,0,L1+L2+L3+L4]);0,0,0,1]; %初始位姿

gst_theta = e1*e2*e3*e4*e5*e6*gst0;

%output
R = gst_theta(1:3,1:3);
P = gst_theta(1:3,4);   %函数返回值  第一行到第三行，第四列








end

