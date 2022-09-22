BEGIN {}
/^\s*$/ {print "Expression with whitespaces. Invalid roman number."; next;}
!/^M{0,3}(C[MD]|D?C{0,3})(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$/ {print "Bad expression. Invalid roman number."; next;}
/^(M{0,3})(C[MD]|D?C{0,3})(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$/ {print "Valid roman number";}

FNR==NR  {print ""}

END {print "END"}
