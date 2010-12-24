function write_quilt(R,C,z_patches,color_names,colors)

% open text file
fid = fopen('quilt.txt','w');

% angle for hexagon vertices
t = (0:1/6:1)'*2*pi;

for r=1:R
  % x coordinate for hexagon center
  % (shift odd rows over 1)
  x0 = mod(r,2);

  for c=1:C
    % patch number
    n = rc2ndx(r,c,C);
    
    for i=1:4
      % cartesian coordinates for hexagon vertices
      x = 0.7^(i-1)*sin(t) + x0 + 2*(c-1);
      y = 0.7^(i-1)*cos(t) - 2 * (r-1);

      % plot hexagon
      col = colors(z_patches(n,i),:);
      fill(x,y,col)
      hold on
    end

    % write colors to file
    % note: patch colors listed inside to out, as stitched
    fprintf(fid,'\tpatch %d: ',c);
    for i=4:-1:1
      fprintf(fid,'%s ',color_names{z_patches(n,i)});
    end
    fprintf(fid,'\n');

  end
end

% clean up axes
hold off
axis square
axis off

% save and crop
print('-dpdf','quilt.pdf')
system('pdfcrop quilt.pdf; mv quilt-crop.pdf quilt.pdf');

% close text file
fclose(fid);