:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

generate_facts_born_this_way_ball_AND_jessie([]) :- assert(born_this_way_ball_AND_jessie(-1,-1)).

generate_facts_born_this_way_ball_AND_jessie([(Start,End) | Tail]) :- assert(born_this_way_ball_AND_jessie(Start,End)), generate_facts_born_this_way_ball_AND_jessie(Tail).

born_this_way_ball_AND_jessie_aux() :- findall((Start,End),born_this_way_ball(Start,End),Interval1), findall((Start,End),jessie(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_born_this_way_ball_AND_jessie(Interval).

born_this_way_ball_AND_jessie_at_1886(Res) :- setof((Start,End),born_this_way_ball_AND_jessie(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = born_this_way_ball_AND_jessie_at_1886'), (born_this_way_ball_AND_jessie_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- born_this_way_ball_AND_jessie_aux().

