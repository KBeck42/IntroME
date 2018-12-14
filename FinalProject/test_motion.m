try
    s = serial('COM6')
    set(s,'Baudrate',115200)
    fopen(s)
    pause(2);
    fprintf (s, 'G17 G20 G90 G94 G54')
    fprintf(s,'G1 X-2.5 F10')
    fclose(s);
catch ME
    fclose(s)
    ME.message
end