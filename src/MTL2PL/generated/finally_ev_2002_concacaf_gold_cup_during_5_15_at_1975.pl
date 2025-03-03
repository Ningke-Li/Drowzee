:- include('database.pl').
ev_2002_concacaf_gold_cup(Start,End) :- begin('ev_2002_concacaf_gold_cup',_,_,Start), end('ev_2002_concacaf_gold_cup',_,_,End), Start=<End.

finally_ev_2002_concacaf_gold_cup_during_5_15(Start,End) :- ev_2002_concacaf_gold_cup(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

finally_ev_2002_concacaf_gold_cup_during_5_15_at_1975(Res) :- setof((Start,End),finally_ev_2002_concacaf_gold_cup_during_5_15(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2002_concacaf_gold_cup_during_5_15_at_1975'), (finally_ev_2002_concacaf_gold_cup_during_5_15_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

