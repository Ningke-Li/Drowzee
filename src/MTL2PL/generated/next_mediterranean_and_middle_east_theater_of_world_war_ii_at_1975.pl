:- include('database.pl').
mediterranean_and_middle_east_theater_of_world_war_ii(Start,End) :- begin('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,Start), end('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,End), Start=<End.

next_mediterranean_and_middle_east_theater_of_world_war_ii(Start,End) :- mediterranean_and_middle_east_theater_of_world_war_ii(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_mediterranean_and_middle_east_theater_of_world_war_ii_at_1975(Res) :- setof((Start,End),next_mediterranean_and_middle_east_theater_of_world_war_ii(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = next_mediterranean_and_middle_east_theater_of_world_war_ii_at_1975'), (next_mediterranean_and_middle_east_theater_of_world_war_ii_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

