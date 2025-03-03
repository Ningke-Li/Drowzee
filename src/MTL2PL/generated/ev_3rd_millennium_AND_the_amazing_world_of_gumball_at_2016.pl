:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

the_amazing_world_of_gumball(Start,End) :- begin('the_amazing_world_of_gumball',_,_,Start), end('the_amazing_world_of_gumball',_,_,End), Start=<End.

generate_facts_ev_3rd_millennium_AND_the_amazing_world_of_gumball([]) :- assert(ev_3rd_millennium_AND_the_amazing_world_of_gumball(-1,-1)).

generate_facts_ev_3rd_millennium_AND_the_amazing_world_of_gumball([(Start,End) | Tail]) :- assert(ev_3rd_millennium_AND_the_amazing_world_of_gumball(Start,End)), generate_facts_ev_3rd_millennium_AND_the_amazing_world_of_gumball(Tail).

ev_3rd_millennium_AND_the_amazing_world_of_gumball_aux() :- findall((Start,End),ev_3rd_millennium(Start,End),Interval1), findall((Start,End),the_amazing_world_of_gumball(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_3rd_millennium_AND_the_amazing_world_of_gumball(Interval).

ev_3rd_millennium_AND_the_amazing_world_of_gumball_at_2016(Res) :- setof((Start,End),ev_3rd_millennium_AND_the_amazing_world_of_gumball(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_AND_the_amazing_world_of_gumball_at_2016'), (ev_3rd_millennium_AND_the_amazing_world_of_gumball_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_3rd_millennium_AND_the_amazing_world_of_gumball_aux().

