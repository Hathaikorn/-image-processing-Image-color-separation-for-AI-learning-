clc

clear all

close all

warning off

[filename, pathname] = uigetfile('*.*', 'mypic.jpg');


if isequal(filename,0) || isequal(pathname,0)

    disp('User pressed cancel')

else

    filename=strcat(pathname,filename);

    rgbImage=imread(filename);

    imshow(rgbImage);

    title('Original Image');

    k=input('Enter the k value: ');

    close

    subplot(1,2,1);

    imshow(rgbImage);

    title('Original Image');

    redChannel=rgbImage(:, :, 1);

    greenChannel=rgbImage(:, :, 2);

    blueChannel=rgbImage(:, :, 3);

    data=double([redChannel(:), greenChannel(:), blueChannel(:)]);

    numberOfClasses=k;

    [m n]=kmeans(data,numberOfClasses);

    m=reshape(m,size(rgbImage,1),size(rgbImage,2));

    n=n/255;

    clusteredImage=label2rgb(m,n);

    subplot(1,2,2);

    imshow(clusteredImage);

    title('Clustered Image');

    frequency=[];

    temp=0;

    for i = 1:k

        for a=1:size(rgbImage,1)

            for b=6:size(rgbImage,2)

                if(m(a,b)==i)

                    temp=temp+1;

                end

            end

        end

        frequency=[frequency temp];

        temp=0;

    end

    figure;

    pie(frequency)

    colormap([n])%define the color scheme

    [ma na]=max(frequency);

    disp(n(na,:));

end
