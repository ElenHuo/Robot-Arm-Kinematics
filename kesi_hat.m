function [kesi,kesi_hat] = kesi_hat(w,q)

v = -cross(w,q);
W = [0,-w(3),w(2);w(3),0,-w(1);-w(2),w(1),0];
kesi_hat = [W,v;0,0];
kesi = [v;w];
end