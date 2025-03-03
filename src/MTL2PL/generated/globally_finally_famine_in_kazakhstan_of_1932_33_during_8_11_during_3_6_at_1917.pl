:- include('database.pl').
famine_in_kazakhstan_of_1932_33(Start,End) :- begin('famine_in_kazakhstan_of_1932_33',_,_,Start), end('famine_in_kazakhstan_of_1932_33',_,_,End), Start=<End.

finally_famine_in_kazakhstan_of_1932_33_during_8_11(Start,End) :- famine_in_kazakhstan_of_1932_33(Start1,End1), (Start1-11)=<(End1-8), Start is (Start1-11), End is (End1-8), Start=<End.

globally_finally_famine_in_kazakhstan_of_1932_33_during_8_11_during_3_6(Start,End) :- finally_famine_in_kazakhstan_of_1932_33_during_8_11(Start1,End1), Start is (Start1-3), End is (End1-6), Start=<End.

globally_finally_famine_in_kazakhstan_of_1932_33_during_8_11_during_3_6_at_1917(Res) :- setof((Start,End),globally_finally_famine_in_kazakhstan_of_1932_33_during_8_11_during_3_6(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = globally_finally_famine_in_kazakhstan_of_1932_33_during_8_11_during_3_6_at_1917'), (globally_finally_famine_in_kazakhstan_of_1932_33_during_8_11_during_3_6_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

