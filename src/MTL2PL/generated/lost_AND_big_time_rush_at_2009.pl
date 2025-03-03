:- include('database.pl').
lost(Start,End) :- begin('lost',_,_,Start), end('lost',_,_,End), Start=<End.

big_time_rush(Start,End) :- begin('big_time_rush',_,_,Start), end('big_time_rush',_,_,End), Start=<End.

generate_facts_lost_AND_big_time_rush([]) :- assert(lost_AND_big_time_rush(-1,-1)).

generate_facts_lost_AND_big_time_rush([(Start,End) | Tail]) :- assert(lost_AND_big_time_rush(Start,End)), generate_facts_lost_AND_big_time_rush(Tail).

lost_AND_big_time_rush_aux() :- findall((Start,End),lost(Start,End),Interval1), findall((Start,End),big_time_rush(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_lost_AND_big_time_rush(Interval).

lost_AND_big_time_rush_at_2009(Res) :- setof((Start,End),lost_AND_big_time_rush(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = lost_AND_big_time_rush_at_2009'), (lost_AND_big_time_rush_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lost_AND_big_time_rush_aux().

