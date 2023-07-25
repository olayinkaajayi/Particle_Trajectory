%Script name: countourPlot
load Results.mat values
Result= values;
cnt1= 0;
cnt2= 0;
cnt3= 0;

for i=1:length(Result)
    if Result(i,1)==0.5
        cnt1= cnt1+1;
        zeroPt5vals(cnt1,:)= Result(i,2:3);
    end
    
    if Result(i,1)==1.5
        cnt2= cnt2+1;
        onePt5vals(cnt2,:)= Result(i,2:3);
    end
    
    tol= 1e-3;
    if ((2/3)-tol<=Result(i,1)) && (Result(i,1)<=(2/3)+tol)
        cnt3= cnt3+1;
        two_thirdvals(cnt3,:)= Result(i,2:3);
    end
    
end

% figure(1)
% plot(zeroPt5vals(:,1),zeroPt5vals(:,2),'r')
% hold on
% plot(onePt5vals(:,1),onePt5vals(:,2),'b')
% plot(two_thirdvals(:,1),two_thirdvals(:,2),'g')
% xlabel('Stokes Number')
% ylabel('Ratio of Source to sink')
% title('For R')
figure(1)
plot(zeroPt5vals(:,1),zeroPt5vals(:,2),'r')
xlabel('Stokes Number')
ylabel('Ratio of Source to sink')
title('For R= 0.5')
figure(2)
plot(onePt5vals(:,1),onePt5vals(:,2),'b')
xlabel('Stokes Number')
ylabel('Ratio of Source to sink')
title('For R= 1.5')
figure(3)
plot(two_thirdvals(:,1),two_thirdvals(:,2),'g')
xlabel('Stokes Number')
ylabel('Ratio of Source to sink')
title('For R= 2/3')