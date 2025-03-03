:- include('database.pl').
splash_and_bubbles(Start,End) :- begin('splash_and_bubbles',_,_,Start), end('splash_and_bubbles',_,_,End), Start=<End.

luke_cage(Start,End) :- begin('luke_cage',_,_,Start), end('luke_cage',_,_,End), Start=<End.

generate_facts_splash_and_bubbles_AND_luke_cage([]) :- assert(splash_and_bubbles_AND_luke_cage(-1,-1)).

generate_facts_splash_and_bubbles_AND_luke_cage([(Start,End) | Tail]) :- assert(splash_and_bubbles_AND_luke_cage(Start,End)), generate_facts_splash_and_bubbles_AND_luke_cage(Tail).

splash_and_bubbles_AND_luke_cage_aux() :- findall((Start,End),splash_and_bubbles(Start,End),Interval1), findall((Start,End),luke_cage(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_splash_and_bubbles_AND_luke_cage(Interval).

splash_and_bubbles_AND_luke_cage_at_2018(Res) :- setof((Start,End),splash_and_bubbles_AND_luke_cage(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = splash_and_bubbles_AND_luke_cage_at_2018'), (splash_and_bubbles_AND_luke_cage_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- splash_and_bubbles_AND_luke_cage_aux().

