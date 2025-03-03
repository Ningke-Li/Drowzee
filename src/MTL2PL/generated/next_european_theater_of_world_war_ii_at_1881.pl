:- include('database.pl').
european_theater_of_world_war_ii(Start,End) :- begin('european_theater_of_world_war_ii',_,_,Start), end('european_theater_of_world_war_ii',_,_,End), Start=<End.

next_european_theater_of_world_war_ii(Start,End) :- european_theater_of_world_war_ii(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_european_theater_of_world_war_ii_at_1881(Res) :- setof((Start,End),next_european_theater_of_world_war_ii(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = next_european_theater_of_world_war_ii_at_1881'), (next_european_theater_of_world_war_ii_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

