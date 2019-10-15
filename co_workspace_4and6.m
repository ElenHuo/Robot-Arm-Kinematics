clear;
theta = zeros(4,1);
x = 0;
y = 0;
z = 0;

for theta1 = -135:5:135
    for theta2 = -150:5:150
        %for theta3 = -135:80:135 %绘制工作空间时可忽略
            for theta4 = 0:20:200
                theta=[theta1/180*pi,theta2/180*pi,0,theta4];
                [R,P] = scara_poe(theta);
                x = [x,P(1)];
                y = [y,P(2)];
                z = [z,P(3)];
            end
        %end
    end
end



tx = -x;
ty = -y + 800;
tz = z + 250;

scatter3(tx,ty,tz,'*');
hold on


clear
theta = zeros(6,1);
x = 0;
y = 0;
z = 0;
theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;
theta5 = 0;
theta6 = 0;
for theta1 = -170:10:170 %-170:10:170表示迭代从170开始，步长为10，最大不超过170，即代表行向量-170 -160 -150 ...170。
    for theta2 = -110:10:110
        for theta3 = -136:10:136
%             for theta4 = -185:40:185        %绘制工作空间时可以忽略四到六关节，加快绘图时间
%                 for theta5 = -120:30:120
                    %for theta6 = -360:100:360
                        theta=[theta1,theta2,theta3,theta4,theta5,theta6]*pi/180;
                        [R,P] =Axis_6_poe(theta);
                        x = [x,P(1)];
                        y = [y,P(2)];
                        z = [z,P(3)];
                    %end
%                 end
%             end
        end
    end
end

scatter3(x,y,z,'*');
hold off