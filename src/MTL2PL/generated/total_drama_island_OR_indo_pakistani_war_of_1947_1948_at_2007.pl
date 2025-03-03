:- include('database.pl').
total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

indo_pakistani_war_of_1947_1948(Start,End) :- begin('indo_pakistani_war_of_1947_1948',_,_,Start), end('indo_pakistani_war_of_1947_1948',_,_,End), Start=<End.

generate_facts_total_drama_island_OR_indo_pakistani_war_of_1947_1948([]) :- assert(total_drama_island_OR_indo_pakistani_war_of_1947_1948(-1,-1)).

generate_facts_total_drama_island_OR_indo_pakistani_war_of_1947_1948([(Start,End) | Tail]) :- assert(total_drama_island_OR_indo_pakistani_war_of_1947_1948(Start,End)), generate_facts_total_drama_island_OR_indo_pakistani_war_of_1947_1948(Tail).

total_drama_island_OR_indo_pakistani_war_of_1947_1948_aux() :- findall((Start,End),total_drama_island(Start,End),Interval1), findall((Start,End),indo_pakistani_war_of_1947_1948(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_total_drama_island_OR_indo_pakistani_war_of_1947_1948(Interval).

total_drama_island_OR_indo_pakistani_war_of_1947_1948_at_2007(Res) :- setof((Start,End),total_drama_island_OR_indo_pakistani_war_of_1947_1948(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = total_drama_island_OR_indo_pakistani_war_of_1947_1948_at_2007'), (total_drama_island_OR_indo_pakistani_war_of_1947_1948_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- total_drama_island_OR_indo_pakistani_war_of_1947_1948_aux().

