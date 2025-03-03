:- include('database.pl').
scream_queens(Start,End) :- begin('scream_queens',_,_,Start), end('scream_queens',_,_,End), Start=<End.

gilded_age(Start,End) :- begin('gilded_age',_,_,Start), end('gilded_age',_,_,End), Start=<End.

generate_facts_scream_queens_OR_gilded_age([]) :- assert(scream_queens_OR_gilded_age(-1,-1)).

generate_facts_scream_queens_OR_gilded_age([(Start,End) | Tail]) :- assert(scream_queens_OR_gilded_age(Start,End)), generate_facts_scream_queens_OR_gilded_age(Tail).

scream_queens_OR_gilded_age_aux() :- findall((Start,End),scream_queens(Start,End),Interval1), findall((Start,End),gilded_age(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_scream_queens_OR_gilded_age(Interval).

scream_queens_OR_gilded_age_at_1899(Res) :- setof((Start,End),scream_queens_OR_gilded_age(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = scream_queens_OR_gilded_age_at_1899'), (scream_queens_OR_gilded_age_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scream_queens_OR_gilded_age_aux().

