:- include('database.pl').
dragon_ball_super(Start,End) :- begin('dragon_ball_super',_,_,Start), end('dragon_ball_super',_,_,End), Start=<End.

westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

generate_facts_dragon_ball_super_AND_westworld([]) :- assert(dragon_ball_super_AND_westworld(-1,-1)).

generate_facts_dragon_ball_super_AND_westworld([(Start,End) | Tail]) :- assert(dragon_ball_super_AND_westworld(Start,End)), generate_facts_dragon_ball_super_AND_westworld(Tail).

dragon_ball_super_AND_westworld_aux() :- findall((Start,End),dragon_ball_super(Start,End),Interval1), findall((Start,End),westworld(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dragon_ball_super_AND_westworld(Interval).

dragon_ball_super_AND_westworld_at_1876(Res) :- setof((Start,End),dragon_ball_super_AND_westworld(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = dragon_ball_super_AND_westworld_at_1876'), (dragon_ball_super_AND_westworld_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dragon_ball_super_AND_westworld_aux().

