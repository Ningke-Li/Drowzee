:- include('database.pl').
eighty_years__war(Start,End) :- begin('eighty_years__war',_,_,Start), end('eighty_years__war',_,_,End), Start=<End.

finally_eighty_years__war_during_8_19(Start,End) :- eighty_years__war(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

next_finally_eighty_years__war_during_8_19(Start,End) :- finally_eighty_years__war_during_8_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_eighty_years__war_during_8_19_at_1558(Res) :- setof((Start,End),next_finally_eighty_years__war_during_8_19(Start,End),AllINtervals), checkvalidity(1558,AllINtervals,Res).

check_query() :- write('Query = next_finally_eighty_years__war_during_8_19_at_1558'), (next_finally_eighty_years__war_during_8_19_at_1558(true) -> write('\nRes   = true');write('\nRes   = false')).

