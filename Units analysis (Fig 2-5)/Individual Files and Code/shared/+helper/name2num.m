function num = name2num(name)
    num = name - '0';
    num = str2double(name(find( num>=0 & num<10 )));
end