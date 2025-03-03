:- include('database.pl').
ray_william_johnson(Start,End) :- begin('ray_william_johnson',_,_,Start), end('ray_william_johnson',_,_,End), Start=<End.

finally_ray_william_johnson_during_5_16(Start,End) :- ray_william_johnson(Start1,End1), (Start1-16)=<(End1-5), Start is (Start1-16), End is (End1-5), Start=<End.

finally_ray_william_johnson_during_5_16_at_2006(Res) :- setof((Start,End),finally_ray_william_johnson_during_5_16(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = finally_ray_william_johnson_during_5_16_at_2006'), (finally_ray_william_johnson_during_5_16_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

