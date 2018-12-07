try
    % COM port for the GRBL
    % May need to change COM port
    s = serial('COM6')
    % Setting baudrate
    set(s,'Baudrate',115200)
    % Open COM port
    fopen(s)
    % Pause so GRBL doesn't crap out
    pause(2);
    % Set some settings in the GRBL
    fprintf (s, 'G17 G20 G90 G94 G54')
    % Open the file with the gcode from fusion 360
    fid = fopen('gcode.txt');
    % Get the first line of the gcode file
    line = fgetl(fid);
    % Print each line of the gcode file to the GRBL
    while ischar(line)
        fprintf(s, line)
        line = fgetl(fid);
    end
    % Close the gcode file
    fclose(fid);
catch ME
    fclose(s)
    ME.message
end