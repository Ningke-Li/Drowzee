:- include('database.pl').
ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

generate_facts_ray_william_johnson_AND_keeping_up_with_the_kardashians([]) :- assert(ray_william_johnson_AND_keeping_up_with_the_kardashians(-1,-1)).

generate_facts_ray_william_johnson_AND_keeping_up_with_the_kardashians([(Start,End) | Tail]) :- assert(ray_william_johnson_AND_keeping_up_with_the_kardashians(Start,End)), generate_facts_ray_william_johnson_AND_keeping_up_with_the_kardashians(Tail).

ray_william_johnson_AND_keeping_up_with_the_kardashians_aux() :- findall((Start,End),ray_william_johnson(Start,End),Interval1), findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ray_william_johnson_AND_keeping_up_with_the_kardashians(Interval).

ray_william_johnson_AND_keeping_up_with_the_kardashians_at_2011(Res) :- setof((Start,End),ray_william_johnson_AND_keeping_up_with_the_kardashians(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ray_william_johnson_AND_keeping_up_with_the_kardashians_at_2011'), (ray_william_johnson_AND_keeping_up_with_the_kardashians_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ray_william_johnson_AND_keeping_up_with_the_kardashians_aux().

