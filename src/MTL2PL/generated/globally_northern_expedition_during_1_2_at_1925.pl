:- include('database.pl').
northern_expedition(Start,End) :- begin('northern_expedition',_,_,Start), end('northern_expedition',_,_,End), Start=<End.

globally_northern_expedition_during_1_2(Start,End) :- northern_expedition(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_northern_expedition_during_1_2_at_1925(Res) :- setof((Start,End),globally_northern_expedition_during_1_2(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = globally_northern_expedition_during_1_2_at_1925'), (globally_northern_expedition_during_1_2_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

