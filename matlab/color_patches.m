function [z_patches] = color_patches(A,z,R,C,zs_fixed)

% empty N-by-4 matrix of patch colors
z_patches = zeros(R*C,4);

for r=1:R
  for c=1:C
    % patch number
    n = rc2ndx(r,c,C);

    for i=1:4
      if n <= size(zs_fixed,1)
        % used fixed color if one is provided
        z_new = zs_fixed(n,i);
      else
        if i == 1
          % outermost color is already determined
          z_new = z(n);
        else
          % random (different) color for inner hexagons
          zs = setdiff(1:6,z_patches(n,:));
          ndx = randperm(length(zs));
          z_new = zs(ndx(1));
        end
      end

      % record color used
      z_patches(n,i) = z_new;
    end

  end
end
