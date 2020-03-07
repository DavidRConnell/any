function str = digitStringOfLength(range)
%DIGITSTRINGOFLENGTH return a string of digits
%   STR = DIGITSTRINGOFLENGTH(N) generate a string of random digits between 0
%   and 9 of length N.
%
%   STR = DIGITSTRINGOFLENGTH([MINN, MAXN]) generate string of random length
%   between MINN and MAXN.
%
%   See also STRINGOFLENGTH.

    digits = '0':'9';
    str = generateString(digits, range);
end
