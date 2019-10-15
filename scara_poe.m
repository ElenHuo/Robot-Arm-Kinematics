function [R,P] = scara_poe(theta)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
L0 = 325;%S2T altitute
L1 = 250;
L2 = 200;

x = -L1*sin(theta(1))-L2*sin(theta(1)+theta(2));
y = L1*cos(theta(1))+L2*cos(theta(1)+theta(2));
z = L0+theta(4);% theta不能变弧度制是一个高度值！
 %output
R = zeros(3);
P = [x,y,z];%运动的范围






end

