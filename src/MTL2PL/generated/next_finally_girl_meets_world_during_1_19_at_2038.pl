:- include('database.pl').
girl_meets_world(Start,End) :- begin('girl_meets_world',_,_,Start), end('girl_meets_world',_,_,End), Start=<End.

finally_girl_meets_world_during_1_19(Start,End) :- girl_meets_world(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

next_finally_girl_meets_world_during_1_19(Start,End) :- finally_girl_meets_world_during_1_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_girl_meets_world_during_1_19_at_2038(Res) :- setof((Start,End),next_finally_girl_meets_world_during_1_19(Start,End),AllINtervals), checkvalidity(2038,AllINtervals,Res).

check_query() :- write('Query = next_finally_girl_meets_world_during_1_19_at_2038'), (next_finally_girl_meets_world_during_1_19_at_2038(true) -> write('\nRes   = true');write('\nRes   = false')).

