:- include('database.pl').
h_o__just_add_water(Start,End) :- begin('h_o__just_add_water',_,_,Start), end('h_o__just_add_water',_,_,End), Start=<End.

uefa_euro_2008_qualifying(Start,End) :- begin('uefa_euro_2008_qualifying',_,_,Start), end('uefa_euro_2008_qualifying',_,_,End), Start=<End.

generate_facts_h_o__just_add_water_AND_uefa_euro_2008_qualifying([]) :- assert(h_o__just_add_water_AND_uefa_euro_2008_qualifying(-1,-1)).

generate_facts_h_o__just_add_water_AND_uefa_euro_2008_qualifying([(Start,End) | Tail]) :- assert(h_o__just_add_water_AND_uefa_euro_2008_qualifying(Start,End)), generate_facts_h_o__just_add_water_AND_uefa_euro_2008_qualifying(Tail).

h_o__just_add_water_AND_uefa_euro_2008_qualifying_aux() :- findall((Start,End),h_o__just_add_water(Start,End),Interval1), findall((Start,End),uefa_euro_2008_qualifying(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_h_o__just_add_water_AND_uefa_euro_2008_qualifying(Interval).

h_o__just_add_water_AND_uefa_euro_2008_qualifying_at_1947(Res) :- setof((Start,End),h_o__just_add_water_AND_uefa_euro_2008_qualifying(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = h_o__just_add_water_AND_uefa_euro_2008_qualifying_at_1947'), (h_o__just_add_water_AND_uefa_euro_2008_qualifying_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- h_o__just_add_water_AND_uefa_euro_2008_qualifying_aux().

