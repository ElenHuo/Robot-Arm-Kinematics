function [ gama ] = cancel_hat( g )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
a = g(1:3,1:3);
B = g(1:3,4);
A = transpose([a(3,1),a(1,3),a(2,1)]);
gama = [B;A];

end

