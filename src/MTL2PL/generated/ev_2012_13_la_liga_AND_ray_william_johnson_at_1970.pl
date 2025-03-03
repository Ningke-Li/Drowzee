:- include('database.pl').
ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

generate_facts_ev_2012_13_la_liga_AND_ray_william_johnson([]) :- assert(ev_2012_13_la_liga_AND_ray_william_johnson(-1,-1)).

generate_facts_ev_2012_13_la_liga_AND_ray_william_johnson([(Start,End) | Tail]) :- assert(ev_2012_13_la_liga_AND_ray_william_johnson(Start,End)), generate_facts_ev_2012_13_la_liga_AND_ray_william_johnson(Tail).

ev_2012_13_la_liga_AND_ray_william_johnson_aux() :- findall((Start,End),ev_2012_13_la_liga(Start,End),Interval1), findall((Start,End),ray_william_johnson(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2012_13_la_liga_AND_ray_william_johnson(Interval).

ev_2012_13_la_liga_AND_ray_william_johnson_at_1970(Res) :- setof((Start,End),ev_2012_13_la_liga_AND_ray_william_johnson(Start,End),AllINtervals), checkvalidity(1970,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_la_liga_AND_ray_william_johnson_at_1970'), (ev_2012_13_la_liga_AND_ray_william_johnson_at_1970(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_la_liga_AND_ray_william_johnson_aux().

