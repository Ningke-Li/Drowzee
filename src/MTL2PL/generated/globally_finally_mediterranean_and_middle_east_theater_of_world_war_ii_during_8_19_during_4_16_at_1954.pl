:- include('database.pl').
mediterranean_and_middle_east_theater_of_world_war_ii(Start,End) :- begin('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,Start), end('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,End), Start=<End.

finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19(Start,End) :- mediterranean_and_middle_east_theater_of_world_war_ii(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

globally_finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19_during_4_16(Start,End) :- finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19(Start1,End1), Start is (Start1-4), End is (End1-16), Start=<End.

globally_finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19_during_4_16_at_1954(Res) :- setof((Start,End),globally_finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19_during_4_16(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = globally_finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19_during_4_16_at_1954'), (globally_finally_mediterranean_and_middle_east_theater_of_world_war_ii_during_8_19_during_4_16_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

