function [ gama ] = cancel_hat( g )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
a = g(1:3,1:3);
B = g(1:3,4);
A = transpose([a(3,1),a(1,3),a(2,1)]);
gama = [B;A];

end

