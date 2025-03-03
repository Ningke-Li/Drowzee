:- include('database.pl').
scream_queens(Start,End) :- begin('scream_queens',_,_,Start), end('scream_queens',_,_,End), Start=<End.

the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

generate_facts_scream_queens_AND_the_thundermans([]) :- assert(scream_queens_AND_the_thundermans(-1,-1)).

generate_facts_scream_queens_AND_the_thundermans([(Start,End) | Tail]) :- assert(scream_queens_AND_the_thundermans(Start,End)), generate_facts_scream_queens_AND_the_thundermans(Tail).

scream_queens_AND_the_thundermans_aux() :- findall((Start,End),scream_queens(Start,End),Interval1), findall((Start,End),the_thundermans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scream_queens_AND_the_thundermans(Interval).

scream_queens_AND_the_thundermans_at_2015(Res) :- setof((Start,End),scream_queens_AND_the_thundermans(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = scream_queens_AND_the_thundermans_at_2015'), (scream_queens_AND_the_thundermans_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scream_queens_AND_the_thundermans_aux().

