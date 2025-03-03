:- include('database.pl').
bombing_of_hamburg_in_world_war_ii(Start,End) :- begin('bombing_of_hamburg_in_world_war_ii',_,_,Start), end('bombing_of_hamburg_in_world_war_ii',_,_,End), Start=<End.

american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

generate_facts_bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long([]) :- assert(bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long(-1,-1)).

generate_facts_bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long([(Start,End) | Tail]) :- assert(bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long(Start,End)), generate_facts_bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long(Tail).

bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long_aux() :- findall((Start,End),bombing_of_hamburg_in_world_war_ii(Start,End),Interval1), findall((Start,End),american_dragon__jake_long(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long(Interval).

bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long_at_1877(Res) :- setof((Start,End),bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long_at_1877'), (bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bombing_of_hamburg_in_world_war_ii_OR_american_dragon__jake_long_aux().

