:- include('database.pl').
ev_2007_concacaf_gold_cup(Start,End) :- begin('ev_2007_concacaf_gold_cup',_,_,Start), end('ev_2007_concacaf_gold_cup',_,_,End), Start=<End.

next_ev_2007_concacaf_gold_cup(Start,End) :- ev_2007_concacaf_gold_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2007_concacaf_gold_cup_at_2006(Res) :- setof((Start,End),next_ev_2007_concacaf_gold_cup(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = next_ev_2007_concacaf_gold_cup_at_2006'), (next_ev_2007_concacaf_gold_cup_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

