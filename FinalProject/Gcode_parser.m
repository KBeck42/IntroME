fid = fopen('gcode.txt');
line = fgetl(fid);
while ischar(line)
    disp(line)
    line = fgetl(fid);
end
fclose(fid);