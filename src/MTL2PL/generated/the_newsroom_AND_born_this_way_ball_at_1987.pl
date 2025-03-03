:- include('database.pl').
the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

generate_facts_the_newsroom_AND_born_this_way_ball([]) :- assert(the_newsroom_AND_born_this_way_ball(-1,-1)).

generate_facts_the_newsroom_AND_born_this_way_ball([(Start,End) | Tail]) :- assert(the_newsroom_AND_born_this_way_ball(Start,End)), generate_facts_the_newsroom_AND_born_this_way_ball(Tail).

the_newsroom_AND_born_this_way_ball_aux() :- findall((Start,End),the_newsroom(Start,End),Interval1), findall((Start,End),born_this_way_ball(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_newsroom_AND_born_this_way_ball(Interval).

the_newsroom_AND_born_this_way_ball_at_1987(Res) :- setof((Start,End),the_newsroom_AND_born_this_way_ball(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = the_newsroom_AND_born_this_way_ball_at_1987'), (the_newsroom_AND_born_this_way_ball_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_newsroom_AND_born_this_way_ball_aux().

