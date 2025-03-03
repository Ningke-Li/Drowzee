:- include('database.pl').
klondike_gold_rush(Start,End) :- begin('klondike_gold_rush',_,_,Start), end('klondike_gold_rush',_,_,End), Start=<End.

finally_klondike_gold_rush_during_2_20(Start,End) :- klondike_gold_rush(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

finally_klondike_gold_rush_during_2_20_at_1876(Res) :- setof((Start,End),finally_klondike_gold_rush_during_2_20(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = finally_klondike_gold_rush_during_2_20_at_1876'), (finally_klondike_gold_rush_during_2_20_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

