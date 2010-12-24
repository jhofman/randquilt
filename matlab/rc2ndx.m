function [n]=rc2ndx(i,j,C)

% convert (i,j) (row and column) to linear index n
n=C*(i-1) + j;
