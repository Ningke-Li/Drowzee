:- include('database.pl').
three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

generate_facts_three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia([]) :- assert(three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia(-1,-1)).

generate_facts_three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia([(Start,End) | Tail]) :- assert(three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia(Start,End)), generate_facts_three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia(Tail).

three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia_aux() :- findall((Start,End),three_hundred_and_thirty_five_years__war(Start,End),Interval1), findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia(Interval).

three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia_at_1954(Res) :- setof((Start,End),three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia_at_1954'), (three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- three_hundred_and_thirty_five_years__war_AND_world_war_ii_in_yugoslavia_aux().

