% number of rows and columns
C=9;
R=12;

% color names and rgb codes
color_names={'yellow','brown','blue','green','pink','orange'};
colors=[1.0  1.0  0   ;  % yellow
        0.5  0.25 0   ;  % brown
        0    0.25 0.5 ;  % blue
        0    0.25 0.25;  % green
        1.0  0    0.5 ;  % pink
        1.0  0.5  0   ]; % orange

% number of colors
ncolors = length(color_names);

% first couple of patches are fixed, as they were already made
zs_fixed=[5 2 4 3;
          1 3 6 2;
          2 4 1 5;
          6 3 2 4];

% generate adjacency matrix of which patches neighbor each other
A = hex_adjacency_matrix(R,C);

% color outside border of patches so no neighbors have same outside
z = color_graph(A, ncolors, zs_fixed);

% sanity check that no neighboring patches have the same outside
Z=repmat(z',size(z,1),1)==repmat(z,1,size(z,1));
assert(sum(sum(A.*Z)) == 0);

% generate internal patch color ids
z_patches = color_patches(A,z,R,C,zs_fixed);

% write pdf and txt of quilt
write_quilt(R,C,z_patches,color_names,colors);

