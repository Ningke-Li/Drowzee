:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

arrow(Start,End) :- begin('arrow',_,_,Start), end('arrow',_,_,End), Start=<End.

generate_facts_jessica_jones_AND_arrow([]) :- assert(jessica_jones_AND_arrow(-1,-1)).

generate_facts_jessica_jones_AND_arrow([(Start,End) | Tail]) :- assert(jessica_jones_AND_arrow(Start,End)), generate_facts_jessica_jones_AND_arrow(Tail).

jessica_jones_AND_arrow_aux() :- findall((Start,End),jessica_jones(Start,End),Interval1), findall((Start,End),arrow(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jessica_jones_AND_arrow(Interval).

jessica_jones_AND_arrow_at_1929(Res) :- setof((Start,End),jessica_jones_AND_arrow(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = jessica_jones_AND_arrow_at_1929'), (jessica_jones_AND_arrow_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jessica_jones_AND_arrow_aux().

