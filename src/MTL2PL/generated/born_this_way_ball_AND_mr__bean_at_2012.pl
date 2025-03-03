:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

generate_facts_born_this_way_ball_AND_mr__bean([]) :- assert(born_this_way_ball_AND_mr__bean(-1,-1)).

generate_facts_born_this_way_ball_AND_mr__bean([(Start,End) | Tail]) :- assert(born_this_way_ball_AND_mr__bean(Start,End)), generate_facts_born_this_way_ball_AND_mr__bean(Tail).

born_this_way_ball_AND_mr__bean_aux() :- findall((Start,End),born_this_way_ball(Start,End),Interval1), findall((Start,End),mr__bean(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_born_this_way_ball_AND_mr__bean(Interval).

born_this_way_ball_AND_mr__bean_at_2012(Res) :- setof((Start,End),born_this_way_ball_AND_mr__bean(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = born_this_way_ball_AND_mr__bean_at_2012'), (born_this_way_ball_AND_mr__bean_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- born_this_way_ball_AND_mr__bean_aux().

