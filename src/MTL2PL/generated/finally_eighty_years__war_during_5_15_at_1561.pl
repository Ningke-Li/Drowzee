:- include('database.pl').
eighty_years__war(Start,End) :- begin('eighty_years__war',_,_,Start), end('eighty_years__war',_,_,End), Start=<End.

finally_eighty_years__war_during_5_15(Start,End) :- eighty_years__war(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

finally_eighty_years__war_during_5_15_at_1561(Res) :- setof((Start,End),finally_eighty_years__war_during_5_15(Start,End),AllINtervals), checkvalidity(1561,AllINtervals,Res).

check_query() :- write('Query = finally_eighty_years__war_during_5_15_at_1561'), (finally_eighty_years__war_during_5_15_at_1561(true) -> write('\nRes   = true');write('\nRes   = false')).

