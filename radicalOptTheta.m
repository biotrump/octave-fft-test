% *****************************************************************
% Copyright (c) Erik G. Learned-Miller, 2003.
% *****************************************************************
%function [thetaStar,rotStar]=radicalOptTheta(x,stdev,m,reps,K,range)
function [thetaStar,rotStar]=radicalOptTheta(x,stdev,m,reps,K)
% x is the i-row, j-row : 2 rows vectors
% m is the number of intervals in an m-spacing
% reps is the number of points used in smoothing
% K is the number of angles theta to check for each Jacobi rotation.
% d = 2
[d,N]=size(x);
global xAug
% This routine assumes that it gets whitened data.
% First, we augment the points with reps near copies of each point.
%repmat(x,[2,3])=(x x x)	X matrix as a tile and replicate 2x3 tiles
%				(x x x)
if reps==1
  xAug=x;
else

 rn=randn(d,N*reps);
 rns=rn*stdev;
 rp=repmat(x,[1,reps]);
  %xAug=randn(d,N*reps)*stdev+repmat(x,[1,reps]);
  xAug = rns + rp;
end
fprintf(1,'size(xAug)=%d %d\n',size(xAug));

%dlmwrite('rnt.txt',rn','delimiter','\t','precision',5);
%dlmwrite('rnst.txt',rns','delimiter','\t','precision',5);
%dlmwrite('rpt.txt',rp','delimiter','\t','precision',5);
%dlmwrite('xAugt.txt',xAug','delimiter','\t','precision',5);

% Then we rotate this data to various angles, evaluate the sum of
% the marginals, and take the min.
%perc=range/(pi/2);
%numberK=perc*K;
%start=floor(K/2-numberK/2)+1;
%endPt=ceil(K/2+numberK/2);

for i=1:K
  % Map theta from -pi/4 to pi/4 instead of 0 to pi/2.
  % This will allow us to use Amari-distance for test of
  % convergence.
  theta= (i-1)/(K-1)*pi/2-pi/4;
  rot=[cos(theta) -sin(theta); sin(theta) cos(theta)];
  %size(rot) %2x2
  rotPts=rot*xAug;
%  dlmwrite('rot.txt',rot,'delimiter','\t','precision',5);
%  dlmwrite('rotPtst.txt',rotPts','delimiter','\t','precision',5);
  %size(rotPts);2XN
%d =2
  for j=1:d
    marginalAtTheta(j)=vasicekm(rotPts(j,:),m);
  end
  ent(i)=sum(marginalAtTheta);
%  exit;
end
%dlmwrite('ent.txt',ent,'delimiter','\t','precision',5);
[val,ind]=sort(ent);
%fprintf(1,'ind=%d.\n',ind);
thetaStar= (ind(1)-1)/(K-1)*pi/2-pi/4;
fprintf(1,'rotated %5.2f degrees.\n',thetaStar/(2*pi)*360);
rotStar=[cos(thetaStar) -sin(thetaStar); sin(thetaStar) cos(thetaStar)];
%exit 1


