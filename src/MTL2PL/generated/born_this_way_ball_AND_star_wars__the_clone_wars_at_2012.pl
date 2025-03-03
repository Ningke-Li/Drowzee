:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

star_wars__the_clone_wars(Start,End) :- begin('star_wars__the_clone_wars',_,_,Start), end('star_wars__the_clone_wars',_,_,End), Start=<End.

generate_facts_born_this_way_ball_AND_star_wars__the_clone_wars([]) :- assert(born_this_way_ball_AND_star_wars__the_clone_wars(-1,-1)).

generate_facts_born_this_way_ball_AND_star_wars__the_clone_wars([(Start,End) | Tail]) :- assert(born_this_way_ball_AND_star_wars__the_clone_wars(Start,End)), generate_facts_born_this_way_ball_AND_star_wars__the_clone_wars(Tail).

born_this_way_ball_AND_star_wars__the_clone_wars_aux() :- findall((Start,End),born_this_way_ball(Start,End),Interval1), findall((Start,End),star_wars__the_clone_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_born_this_way_ball_AND_star_wars__the_clone_wars(Interval).

born_this_way_ball_AND_star_wars__the_clone_wars_at_2012(Res) :- setof((Start,End),born_this_way_ball_AND_star_wars__the_clone_wars(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = born_this_way_ball_AND_star_wars__the_clone_wars_at_2012'), (born_this_way_ball_AND_star_wars__the_clone_wars_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- born_this_way_ball_AND_star_wars__the_clone_wars_aux().

