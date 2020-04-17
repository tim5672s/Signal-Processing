function[] = echo()
    %insert .wav file 
    filename = '##';
    [y, Fs] = audioread(filename);
    samples = [1,10*Fs];
    clear y Fs;
    [y, Fs] = audioread(filename, samples);
    
    
    %declare parameter
    gain = 0.5;           
    delay = 2;          % in sekunden
    
    sample_delay = round(Fs * delay);
    x(1:sample_delay) = y(1:sample_delay);
   
    for i= sample_delay+1:length(y)
        x(i) = y(i) + gain*y(i-sample_delay);
    end
    
    %play file
    sound(x,Fs);
end
