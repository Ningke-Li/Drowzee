:- include('database.pl').
world_war_i(Start,End) :- begin('world_war_i',_,_,Start), end('world_war_i',_,_,End), Start=<End.

congress_of_vienna(Start,End) :- begin('congress_of_vienna',_,_,Start), end('congress_of_vienna',_,_,End), Start=<End.

generate_facts_world_war_i_OR_congress_of_vienna([]) :- assert(world_war_i_OR_congress_of_vienna(-1,-1)).

generate_facts_world_war_i_OR_congress_of_vienna([(Start,End) | Tail]) :- assert(world_war_i_OR_congress_of_vienna(Start,End)), generate_facts_world_war_i_OR_congress_of_vienna(Tail).

world_war_i_OR_congress_of_vienna_aux() :- findall((Start,End),world_war_i(Start,End),Interval1), findall((Start,End),congress_of_vienna(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_world_war_i_OR_congress_of_vienna(Interval).

world_war_i_OR_congress_of_vienna_at_1918(Res) :- setof((Start,End),world_war_i_OR_congress_of_vienna(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = world_war_i_OR_congress_of_vienna_at_1918'), (world_war_i_OR_congress_of_vienna_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_war_i_OR_congress_of_vienna_aux().

