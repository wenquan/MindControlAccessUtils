if exist('istart', 'var')
        answer = inputdlg({'Start frame', 'End frame'}, 'Cancel to clear previous', 1, ...
            {num2str(istart),num2str(iend)});
    else
        answer = inputdlg({'Start frame', 'End frame'}, '', 1);
end
    
if isempty(answer)
    answer = inputdlg({'Start frame', 'End frame'}, '', 1);
end
    
istart = str2num(answer{1}); %start frame
iend = str2num(answer{2});   %end frame
numframes=iend-istart+1;



T1=mcd(istart).TimeElapsed;
figure;

for j=2:numframes
    i=istart+(j-1);
    t=mcd(i).TimeElapsed;
    if ~mcd(i).DLPisOn
        plot([mcd(i-1).TimeElapsed,mcd(i).TimeElapsed]-T1,[mcd(i-1).HeadCurv*100,mcd(i).HeadCurv*100],'k','Linewidth',2);
        hold on;
    else
        plot([mcd(i-1).TimeElapsed,mcd(i).TimeElapsed]-T1,[mcd(i-1).HeadCurv*100,mcd(i).HeadCurv*100],'g','Linewidth',2);
        hold on;
    end
end
    








