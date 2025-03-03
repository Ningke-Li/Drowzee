:- include('database.pl').
mediterranean_and_middle_east_theater_of_world_war_ii(Start,End) :- begin('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,Start), end('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,End), Start=<End.

anglo_zulu_war(Start,End) :- begin('anglo_zulu_war',_,_,Start), end('anglo_zulu_war',_,_,End), Start=<End.

generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war([]) :- assert(mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war(-1,-1)).

generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war([(Start,End) | Tail]) :- assert(mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war(Start,End)), generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war(Tail).

mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war_aux() :- findall((Start,End),mediterranean_and_middle_east_theater_of_world_war_ii(Start,End),Interval1), findall((Start,End),anglo_zulu_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war(Interval).

mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war_at_1903(Res) :- setof((Start,End),mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war_at_1903'), (mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mediterranean_and_middle_east_theater_of_world_war_ii_OR_anglo_zulu_war_aux().

