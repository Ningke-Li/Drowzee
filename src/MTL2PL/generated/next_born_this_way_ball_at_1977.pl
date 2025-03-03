:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

next_born_this_way_ball(Start,End) :- born_this_way_ball(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_born_this_way_ball_at_1977(Res) :- setof((Start,End),next_born_this_way_ball(Start,End),AllINtervals), checkvalidity(1977,AllINtervals,Res).

check_query() :- write('Query = next_born_this_way_ball_at_1977'), (next_born_this_way_ball_at_1977(true) -> write('\nRes   = true');write('\nRes   = false')).

