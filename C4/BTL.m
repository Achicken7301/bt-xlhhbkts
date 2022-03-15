%% load images
im = 'karyotype.jpg';
im = imread(im);

%% Dat nguong cho anh
J = imbinarize(im, graythresh(im));

%% Tim tat ca duong bien cua cac NST
[B, L] = bwboundaries(~J, 'noholes');
imshow(L); hold on
for i=1:length(B)
    plot(B{i}(:,2),B{i}(:,1),'LineWidth',3) %???ng bi�n
    text(B{i}(1,2),B{i}(1,1),num2str(i),'FontSize',18,'Color','red')
end

%% xay dung khung suon
I = imread('NST.jpg');
figure;imshow(I)
h=fspecial('gaussian',25,10); %t?o kernel l?c gaussian,sigma=10
g=imfilter(I,h,'replicate'); %�p b? l?c l�n ?nh, replicate: v�ng vi?n ?nh th�m v�o c�c pixels gi?ng pixels ?nh g?n nh?t khi kernel tr??t qua
figure;imshow(g)
g1=im2bw(g,graythresh(g)); %t�ch v�ng b?ng ng??ng t? ??ng Otsu
figure;imshow(g1)
s=bwmorph(g1,'skel',Inf); %t�m khung s??n cho v�ng, inf = co l?i v�ng khi cho ??n khi khung s??n ch? l� nh?ng ?i?m
figure;imshow(s)
s=bwmorph(s,'spur',25);%b? ?i c�c nh�nh d? nh? 25 l?n; 25=(sigma/2)^2
figure;imshow(s)