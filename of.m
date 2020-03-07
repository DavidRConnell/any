function choice = of(list)
%OF randomly select a value from a list of options
%   CHOICE = OF(LIST) randomly choose one value from LIST.

    choice = generateString(list, 1);
    choice = choice{1};
end
