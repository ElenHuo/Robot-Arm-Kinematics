function [T] = tw2tr(omega,q,theta)

%v = -cross(w,q);
omega_hat = [0,-omega(3),omega(2);omega(3),0,-omega(1);-omega(2),omega(1),0];
R = eye(3) + omega_hat*sin(theta) + omega_hat*omega_hat*(1 - cos(theta));
t = (eye(3) - R) * q;
T = [R,t;0,0,0,1];
end