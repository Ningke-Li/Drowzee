:- include('database.pl').
world_war_ii(Start,End) :- begin('world_war_ii',_,_,Start), end('world_war_ii',_,_,End), Start=<End.

next_world_war_ii(Start,End) :- world_war_ii(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_world_war_ii_at_1917(Res) :- setof((Start,End),next_world_war_ii(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_world_war_ii_at_1917'), (next_world_war_ii_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

