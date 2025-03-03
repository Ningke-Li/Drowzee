:- include('database.pl').
klondike_gold_rush(Start,End) :- begin('klondike_gold_rush',_,_,Start), end('klondike_gold_rush',_,_,End), Start=<End.

globally_klondike_gold_rush_during_1_2(Start,End) :- klondike_gold_rush(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_klondike_gold_rush_during_1_2_at_1907(Res) :- setof((Start,End),globally_klondike_gold_rush_during_1_2(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = globally_klondike_gold_rush_during_1_2_at_1907'), (globally_klondike_gold_rush_during_1_2_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).

