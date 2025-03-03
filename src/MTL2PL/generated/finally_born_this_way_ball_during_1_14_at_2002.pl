:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

finally_born_this_way_ball_during_1_14(Start,End) :- born_this_way_ball(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_born_this_way_ball_during_1_14_at_2002(Res) :- setof((Start,End),finally_born_this_way_ball_during_1_14(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = finally_born_this_way_ball_during_1_14_at_2002'), (finally_born_this_way_ball_during_1_14_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

