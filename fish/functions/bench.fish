function bench
    for i in (seq 0 9);
        time fish -i -c exit;
    end
end
