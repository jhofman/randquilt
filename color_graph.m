function [z] = color_graph(A, ncolors, zs_fixed)

N = size(A,1);
z = zeros(N,1);

% run over nodes, choosing a color for each
for n=1:N
  if n <= size(zs_fixed,1)
    z(n)=zs_fixed(n,1);
  else
    zs = setdiff(1:ncolors,z(A(n,:)));
    ndx = randperm(length(zs));
    z(n)=zs(ndx(1));
  end
end
