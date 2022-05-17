clear all;
lst=[' ' , '.' , ':' , ';' , '-' , '+', 'i' , 't' , 'f' , 'j' , 'l','d','g','k','e','w'];
%vidObj = VideoReader("C:\Users\Sun\Downloads\间谍过家家OP.mp4");
%frame = read(vidObj,2000);
%I=imread("5.jpg");
I=imread("C:\Users\Sun\Desktop\picssss\1.png");
imshow([I(:,:,1) I(:,:,2) I(:,:,3)]);title('检查RGB三通道的清晰程度')
I=I(:,:,1);
I=imresize(I,0.03);imshow(I);title('降采样')
%count = histogram(I,unique(I));title('显示颜色比例');
txt=lst(end);
for acolor=0:255
a(acolor+1)=sum(sum(I==acolor));
end
Isz=size(I);


txtlst=-9999*ones(size(I));
%txtmatrix=zeros(Isz(1),Isz(2));
%txtmatrix=string(txtmatrix);
for i =1:Isz(1)
    for j = 1:Isz(2)
for k = 0:15
    if  (0+k*16<=I(i,j)&&I(i,j)<16+k*16)
        txtlst(i,j)=16-k;
        break;
    end
end
txtmatrix(i,3*j-2) =  ' ';
txtmatrix(i,3*j-1) =  ' ';
txtmatrix(i,3*j) = lst(txtlst(i,j));
txtmatrix(i,3*j+1) =  ' ';
txtmatrix(i,3*j+2) =  ' ';
    end
end
figure
set(gcf,'unit','normalized','position',[0,0,1,1],'color','none');
for i = 1:Isz(1)
    for j = 1:Isz(2)
        %txt=lst(txtlst(i,j));
        %text(Isz(2)-j,Isz(1)-i,txt,'HorizontalAlignment','center','FontSize',9);
    end
end
writematrix(txtmatrix,['spyfamily111.txt'],'delimiter','space')
% axis equal;xlim([0 Isz(2)]);ylim([0 Isz(1)])
% set(gca,'ytick',[],'yticklabel',[])
% set(gca,'xtick',[],'xticklabel',[])
% box off
% saveas(gcf,'asciiart_5.png')