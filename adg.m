function [ Adg ] = adg(gst)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
p = gst(1:3,4);
R = gst(1:3,1:3);
p_hat = [0,-p(3),p(2);p(3),0,-p(1);-p(2),p(1),0];
B = p_hat * R;
Adg = [R,B;zeros(3),R];
end

