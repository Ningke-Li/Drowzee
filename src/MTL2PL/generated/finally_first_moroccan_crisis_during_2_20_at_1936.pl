:- include('database.pl').
first_moroccan_crisis(Start,End) :- begin('first_moroccan_crisis',_,_,Start), end('first_moroccan_crisis',_,_,End), Start=<End.

finally_first_moroccan_crisis_during_2_20(Start,End) :- first_moroccan_crisis(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

finally_first_moroccan_crisis_during_2_20_at_1936(Res) :- setof((Start,End),finally_first_moroccan_crisis_during_2_20(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = finally_first_moroccan_crisis_during_2_20_at_1936'), (finally_first_moroccan_crisis_during_2_20_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

