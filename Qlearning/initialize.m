function [ Q ] = initialize( )
%INITIALIZE Summary of this function goes here
%   Detailed explanation goes here

    %Q = rand(10,15,4);
    Q = ones(10,15,4);
    for i=1:10
        Q(i,1,4) = 0;
        Q(i,end,3) = 0;
    end
    for i=1:15
        Q(1,i,2) = 0;
        Q(end,i,1) = 0;
    end

end

