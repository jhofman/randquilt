function [A] = hex_adjacency_matrix(R,C)

N=C*R;

A=zeros(N,N);

% build hexagonal adjacency matrix
for r=1:R
  for c=1:C
    n=rc2ndx(r,c,C);
    
    % east
    if c < C
      A(n,n+1)=1;
    end

    if r < R
      % south
      m=rc2ndx(r+1,c,C);
      A(n,m)=1;

      if mod(r,2) && (c < C)
        % southeast (odd row, not end)
        m=rc2ndx(r+1,c+1,C);
        A(n,m)=1;
      end

      if ~mod(r,2) && (c > 1)
        % southwest (even row, not beginning)
        m=rc2ndx(r+1,c-1,C);
        A(n,m)=1;
      end      
    end

  end
end

% symmetrize
A = logical(A + A');
