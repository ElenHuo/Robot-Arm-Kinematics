function [R,P] = scara_poe(theta)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
L0 = 325;%S2T altitute
L1 = 250;
L2 = 200;

x = -L1*sin(theta(1))-L2*sin(theta(1)+theta(2));
y = L1*cos(theta(1))+L2*cos(theta(1)+theta(2));
z = L0+theta(4);% theta���ܱ仡������һ���߶�ֵ��
 %output
R = zeros(3);
P = [x,y,z];%�˶��ķ�Χ






end

