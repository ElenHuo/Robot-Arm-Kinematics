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
for theta1 = -170:10:170 %-170:10:170��ʾ������170��ʼ������Ϊ10����󲻳���170��������������-170 -160 -150 ...170��
    for theta2 = -110:10:110
        for theta3 = -136:10:136
%             for theta4 = -185:40:185        %���ƹ����ռ�ʱ���Ժ����ĵ����ؽڣ��ӿ��ͼʱ��
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
