:- include('database.pl').
ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

globally_ray_william_johnson_during_1_5(Start,End) :- ray_william_johnson(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_ray_william_johnson_during_1_5_at_2008(Res) :- setof((Start,End),globally_ray_william_johnson_during_1_5(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = globally_ray_william_johnson_during_1_5_at_2008'), (globally_ray_william_johnson_during_1_5_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

