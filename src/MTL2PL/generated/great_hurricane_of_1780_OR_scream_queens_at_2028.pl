:- include('database.pl').
great_hurricane_of_1780(Start,End) :- begin('great_hurricane_of_1780',_,_,Start), end('great_hurricane_of_1780',_,_,End), Start=<End.

scream_queens(Start,End) :- begin('scream_queens',_,_,Start), end('scream_queens',_,_,End), Start=<End.

generate_facts_great_hurricane_of_1780_OR_scream_queens([]) :- assert(great_hurricane_of_1780_OR_scream_queens(-1,-1)).

generate_facts_great_hurricane_of_1780_OR_scream_queens([(Start,End) | Tail]) :- assert(great_hurricane_of_1780_OR_scream_queens(Start,End)), generate_facts_great_hurricane_of_1780_OR_scream_queens(Tail).

great_hurricane_of_1780_OR_scream_queens_aux() :- findall((Start,End),great_hurricane_of_1780(Start,End),Interval1), findall((Start,End),scream_queens(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_great_hurricane_of_1780_OR_scream_queens(Interval).

great_hurricane_of_1780_OR_scream_queens_at_2028(Res) :- setof((Start,End),great_hurricane_of_1780_OR_scream_queens(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = great_hurricane_of_1780_OR_scream_queens_at_2028'), (great_hurricane_of_1780_OR_scream_queens_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).
?- great_hurricane_of_1780_OR_scream_queens_aux().

