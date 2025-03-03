:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

generate_facts_weeds_AND_ray_william_johnson([]) :- assert(weeds_AND_ray_william_johnson(-1,-1)).

generate_facts_weeds_AND_ray_william_johnson([(Start,End) | Tail]) :- assert(weeds_AND_ray_william_johnson(Start,End)), generate_facts_weeds_AND_ray_william_johnson(Tail).

weeds_AND_ray_william_johnson_aux() :- findall((Start,End),weeds(Start,End),Interval1), findall((Start,End),ray_william_johnson(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_weeds_AND_ray_william_johnson(Interval).

weeds_AND_ray_william_johnson_at_2009(Res) :- setof((Start,End),weeds_AND_ray_william_johnson(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = weeds_AND_ray_william_johnson_at_2009'), (weeds_AND_ray_william_johnson_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- weeds_AND_ray_william_johnson_aux().

