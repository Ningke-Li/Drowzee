:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

finally_scooby_doo__mystery_incorporated_during_6_16(Start,End) :- scooby_doo__mystery_incorporated(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

globally_finally_scooby_doo__mystery_incorporated_during_6_16_during_3_13(Start,End) :- finally_scooby_doo__mystery_incorporated_during_6_16(Start1,End1), Start is (Start1-3), End is (End1-13), Start=<End.

globally_finally_scooby_doo__mystery_incorporated_during_6_16_during_3_13_at_1891(Res) :- setof((Start,End),globally_finally_scooby_doo__mystery_incorporated_during_6_16_during_3_13(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = globally_finally_scooby_doo__mystery_incorporated_during_6_16_during_3_13_at_1891'), (globally_finally_scooby_doo__mystery_incorporated_during_6_16_during_3_13_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

