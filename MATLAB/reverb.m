function[] = reverb()
    
    %insert .wav file 
    filename = '##';
    [y, Fs] = audioread(filename);
    samples = [1,10*Fs];
    clear y Fs;
    [y, Fs] = audioread(filename, samples);
    
    %declare parameter
    gain = 0.6;           
    delay = 0.6;          % in seconds
    
    sample_delay = round(Fs * delay);
     
    input = y(1:length(y));
    x(1:sample_delay) = y(1:sample_delay);
    
    
    for i= sample_delay+1:length(y)
        %save in new array 
        x(i) = input(i) + gain*x(i-sample_delay);
    end
    
    %play file
    sound(x,Fs);
end
