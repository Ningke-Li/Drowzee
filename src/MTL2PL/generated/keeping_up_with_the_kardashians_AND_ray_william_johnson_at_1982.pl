:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

generate_facts_keeping_up_with_the_kardashians_AND_ray_william_johnson([]) :- assert(keeping_up_with_the_kardashians_AND_ray_william_johnson(-1,-1)).

generate_facts_keeping_up_with_the_kardashians_AND_ray_william_johnson([(Start,End) | Tail]) :- assert(keeping_up_with_the_kardashians_AND_ray_william_johnson(Start,End)), generate_facts_keeping_up_with_the_kardashians_AND_ray_william_johnson(Tail).

keeping_up_with_the_kardashians_AND_ray_william_johnson_aux() :- findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval1), findall((Start,End),ray_william_johnson(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_keeping_up_with_the_kardashians_AND_ray_william_johnson(Interval).

keeping_up_with_the_kardashians_AND_ray_william_johnson_at_1982(Res) :- setof((Start,End),keeping_up_with_the_kardashians_AND_ray_william_johnson(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = keeping_up_with_the_kardashians_AND_ray_william_johnson_at_1982'), (keeping_up_with_the_kardashians_AND_ray_william_johnson_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).
?- keeping_up_with_the_kardashians_AND_ray_william_johnson_aux().

