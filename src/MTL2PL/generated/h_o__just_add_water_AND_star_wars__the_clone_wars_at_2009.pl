:- include('database.pl').
h_o__just_add_water(Start,End) :- begin('h_o__just_add_water',_,_,Start), end('h_o__just_add_water',_,_,End), Start=<End.

star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

generate_facts_h_o__just_add_water_AND_star_wars__the_clone_wars([]) :- assert(h_o__just_add_water_AND_star_wars__the_clone_wars(-1,-1)).

generate_facts_h_o__just_add_water_AND_star_wars__the_clone_wars([(Start,End) | Tail]) :- assert(h_o__just_add_water_AND_star_wars__the_clone_wars(Start,End)), generate_facts_h_o__just_add_water_AND_star_wars__the_clone_wars(Tail).

h_o__just_add_water_AND_star_wars__the_clone_wars_aux() :- findall((Start,End),h_o__just_add_water(Start,End),Interval1), findall((Start,End),star_wars__the_clone_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_h_o__just_add_water_AND_star_wars__the_clone_wars(Interval).

h_o__just_add_water_AND_star_wars__the_clone_wars_at_2009(Res) :- setof((Start,End),h_o__just_add_water_AND_star_wars__the_clone_wars(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = h_o__just_add_water_AND_star_wars__the_clone_wars_at_2009'), (h_o__just_add_water_AND_star_wars__the_clone_wars_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- h_o__just_add_water_AND_star_wars__the_clone_wars_aux().

