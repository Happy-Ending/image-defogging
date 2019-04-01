function out = darktest(filename)
w0=0.65;   %0.65  �˻�������������һЩ��1ʱ��ȫȥ��    
t0=0.1;
I=filename;
[h,w,s]=size(I);
min_I=zeros(h,w);           
 
%����ȡ�ð�Ӱͨ��ͼ��
for i=1:h                 
    for j=1:w
        dark_I(i,j)=min(I(i,j,:));
    end
end
 
Max_dark_channel=double(max(max(dark_I)))  %�������
dark_channel=double(dark_I);
t=1-w0*(dark_channel/Max_dark_channel);   %ȡ��͸л�ֲ���ͼ

t=max(t,t0);
 
I1=double(I);
J(:,:,1) = uint8((I1(:,:,1) - (1-t)*Max_dark_channel)./t);
 
J(:,:,2) = uint8((I1(:,:,2) - (1-t)*Max_dark_channel)./t);
 
J(:,:,3) =uint8((I1(:,:,3) - (1-t)*Max_dark_channel)./t);
out = J;
end