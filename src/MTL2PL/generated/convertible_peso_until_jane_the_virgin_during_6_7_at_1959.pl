:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

jane_the_virgin(Start,End) :- begin('jane_the_virgin',_,_,Start), end('jane_the_virgin',_,_,End), Start=<End.

convertible_peso_last_till_6_7(Start,End) :- convertible_peso(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

convertible_peso_until_jane_the_virgin_during_6_7_overlap(Start,End) :- convertible_peso_last_till_6_7(Start1,End1), jane_the_virgin(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

convertible_peso_until_jane_the_virgin_during_6_7(Start,End) :- convertible_peso(W1,_), convertible_peso_until_jane_the_virgin_during_6_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-6), Start=<End.

convertible_peso_until_jane_the_virgin_during_6_7_at_1959(Res) :- setof((Start,End),convertible_peso_until_jane_the_virgin_during_6_7(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_until_jane_the_virgin_during_6_7_at_1959'), (convertible_peso_until_jane_the_virgin_during_6_7_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

