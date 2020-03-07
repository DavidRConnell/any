function str = generateString(charSet, range)
%GENERATESTRING create random string from characters in a given set
%   STR = GENERATESTRING(CHARSET, N) creates a string, STR, of N randomly
%   sampled characters from CHARSET.
%
%   STR = GENERATESTRING(CHARSET, [MINN, MAXN]) randomly selects the length
%   of the returned STR to be between MINN and MAXN.

    if length(range) == 1 && range > 0
        outStringLength = range;
    elseif length(range) == 2 && all(range > 0)
        outStringLength = randi(range);
    else
        error('Any:IncorrectRangeFormat', ...
              ['Second argument to "GENERATESTRING" must be', ...
               'either a length or a range of possible lengths']);
    end

    charIndeces = randi(length(charSet), [1, outStringLength]);
    str = charSet(charIndeces);
end
