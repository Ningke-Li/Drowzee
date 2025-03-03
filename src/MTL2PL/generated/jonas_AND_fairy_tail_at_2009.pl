:- include('database.pl').
jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

generate_facts_jonas_AND_fairy_tail([]) :- assert(jonas_AND_fairy_tail(-1,-1)).

generate_facts_jonas_AND_fairy_tail([(Start,End) | Tail]) :- assert(jonas_AND_fairy_tail(Start,End)), generate_facts_jonas_AND_fairy_tail(Tail).

jonas_AND_fairy_tail_aux() :- findall((Start,End),jonas(Start,End),Interval1), findall((Start,End),fairy_tail(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jonas_AND_fairy_tail(Interval).

jonas_AND_fairy_tail_at_2009(Res) :- setof((Start,End),jonas_AND_fairy_tail(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = jonas_AND_fairy_tail_at_2009'), (jonas_AND_fairy_tail_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jonas_AND_fairy_tail_aux().

