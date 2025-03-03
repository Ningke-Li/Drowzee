:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

generate_facts_born_this_way_ball_AND_the_vampire_diaries([]) :- assert(born_this_way_ball_AND_the_vampire_diaries(-1,-1)).

generate_facts_born_this_way_ball_AND_the_vampire_diaries([(Start,End) | Tail]) :- assert(born_this_way_ball_AND_the_vampire_diaries(Start,End)), generate_facts_born_this_way_ball_AND_the_vampire_diaries(Tail).

born_this_way_ball_AND_the_vampire_diaries_aux() :- findall((Start,End),born_this_way_ball(Start,End),Interval1), findall((Start,End),the_vampire_diaries(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_born_this_way_ball_AND_the_vampire_diaries(Interval).

born_this_way_ball_AND_the_vampire_diaries_at_1939(Res) :- setof((Start,End),born_this_way_ball_AND_the_vampire_diaries(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = born_this_way_ball_AND_the_vampire_diaries_at_1939'), (born_this_way_ball_AND_the_vampire_diaries_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).
?- born_this_way_ball_AND_the_vampire_diaries_aux().

