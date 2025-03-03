:- include('database.pl').
born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

generate_facts_born_this_way_ball_AND_scooby_doo__mystery_incorporated([]) :- assert(born_this_way_ball_AND_scooby_doo__mystery_incorporated(-1,-1)).

generate_facts_born_this_way_ball_AND_scooby_doo__mystery_incorporated([(Start,End) | Tail]) :- assert(born_this_way_ball_AND_scooby_doo__mystery_incorporated(Start,End)), generate_facts_born_this_way_ball_AND_scooby_doo__mystery_incorporated(Tail).

born_this_way_ball_AND_scooby_doo__mystery_incorporated_aux() :- findall((Start,End),born_this_way_ball(Start,End),Interval1), findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_born_this_way_ball_AND_scooby_doo__mystery_incorporated(Interval).

born_this_way_ball_AND_scooby_doo__mystery_incorporated_at_1908(Res) :- setof((Start,End),born_this_way_ball_AND_scooby_doo__mystery_incorporated(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = born_this_way_ball_AND_scooby_doo__mystery_incorporated_at_1908'), (born_this_way_ball_AND_scooby_doo__mystery_incorporated_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).
?- born_this_way_ball_AND_scooby_doo__mystery_incorporated_aux().

