:- include('database.pl').
the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

ev_2011_yemeni_revolution(Start,End) :- begin('ev_2011_yemeni_revolution',_,_,Start), end('ev_2011_yemeni_revolution',_,_,End), Start=<End.

generate_facts_the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution([]) :- assert(the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution(-1,-1)).

generate_facts_the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution([(Start,End) | Tail]) :- assert(the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution(Start,End)), generate_facts_the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution(Tail).

the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution_aux() :- findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval1), findall((Start,End),ev_2011_yemeni_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution(Interval).

the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution_at_1973(Res) :- setof((Start,End),the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution(Start,End),AllINtervals), checkvalidity(1973,AllINtervals,Res).

check_query() :- write('Query = the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution_at_1973'), (the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution_at_1973(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_amazing_world_of_gumball_AND_ev_2011_yemeni_revolution_aux().

