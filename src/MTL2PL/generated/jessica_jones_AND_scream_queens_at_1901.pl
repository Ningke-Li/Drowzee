:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

scream_queens(Start,End) :- begin('scream_queens',_,_,Start), end('scream_queens',_,_,End), Start=<End.

generate_facts_jessica_jones_AND_scream_queens([]) :- assert(jessica_jones_AND_scream_queens(-1,-1)).

generate_facts_jessica_jones_AND_scream_queens([(Start,End) | Tail]) :- assert(jessica_jones_AND_scream_queens(Start,End)), generate_facts_jessica_jones_AND_scream_queens(Tail).

jessica_jones_AND_scream_queens_aux() :- findall((Start,End),jessica_jones(Start,End),Interval1), findall((Start,End),scream_queens(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jessica_jones_AND_scream_queens(Interval).

jessica_jones_AND_scream_queens_at_1901(Res) :- setof((Start,End),jessica_jones_AND_scream_queens(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = jessica_jones_AND_scream_queens_at_1901'), (jessica_jones_AND_scream_queens_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jessica_jones_AND_scream_queens_aux().

