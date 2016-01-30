%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Getting geometry from abaqus to export it to ensight
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% LOADING FILES OF NODES AND ELEM %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% WRITING HEADING FOR VTK FILE

	% printing heading to file
f=fopen(‘MyParaviewFile.vtk','w');
fprintf(f,'# vtk DataFile Version 1.0\n');
fprintf(f,'ECM-CELL DIFFUSION-MECHANICS\n');
fprintf(f,'ASCII\n');
fprintf(f,'\n');
fprintf(f,'DATASET UNSTRUCTURED_GRID\n');
fprintf(f,'%s %8i %s\n','POINTS', nnode ,'float');

%%%%%%%%%%%%%%%%%%%%%% WRITING COORDINATES OF NODES %%%%%%%%%%%%%%%%%%%%%%%%%

	% printing coordinates
for i1=1:nnode
           fprintf(f,'%14.8E %14.8E %14.8E\n',nodos(i1,2:4));
end
fprintf(f,'\n');

%%%%%%%%%%%%%%%%%%%%%% WRITING CONNECTIVITY OF NODES %%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(f,'%s %8i %8i\n','CELLS', nelem , nelem*4);
for i1=1:nelem
            new_conects(1,1)=find(nodos(:,1) == conectividades(i1,2) );
            new_conects(1,2)=find(nodos(:,1) == conectividades(i1,3) );
            new_conects(1,3)=find(nodos(:,1) == conectividades(i1,4) );      
            fprintf(f,'%4i  %10i  %10i  %10i\n',3,new_conects(1,1)-1,new_conects(1,2)-1,new_conects(1,3)-1);
end
fprintf(f,'\n');
fprintf(f,'%s %8i\n','CELL_TYPES', nelem);
for i1=1:nelem
            fprintf(f,' %4i ', 5);
end
fprintf(f,'\n');          

%%%%%%%%%%%%%%%%%%%%%% WRITING VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(f,'%s %8i\n','POINT_DATA', nnode);
fprintf(f,'SCALARS Ux float\n');
fprintf(f,'LOOKUP_TABLE default\n');
for i1=1:nnode
           fprintf(f,'%14.8E\n', ValueOfSomethingAtNode );
end

fprintf(f,'%s %8i\n','CELL_DATA', nelem);
fprintf(f,'SCALARS C10 float\n');
fprintf(f,'LOOKUP_TABLE default\n');
for i1=1:nelem
           fprintf(f,'%14.8E\n', ValueOfSomethingAtCentroid );
end
fclose(f)
