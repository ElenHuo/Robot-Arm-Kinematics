clear;
theta = zeros(4,1);
x = 0;
y = 0;
z = 0;

for theta1 = -135:10:135
    for theta2 = -150:10:150
        %for theta3 = -135:80:135 %绘制工作空间时可忽略
            for theta4 = 0:10:200
                theta=[theta1/180*pi,theta2/180*pi,0,theta4];
                [R,P] = scara_poe(theta);
                x = [x,P(1)];
                y = [y,P(2)];
                z = [z,P(3)];
            end
        %end
    end
end

scatter3(x,y,z,'*');