:- include('database.pl').
ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

next_ray_william_johnson(Start,End) :- ray_william_johnson(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ray_william_johnson_at_2008(Res) :- setof((Start,End),next_ray_william_johnson(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_ray_william_johnson_at_2008'), (next_ray_william_johnson_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

