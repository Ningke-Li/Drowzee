:- include('database.pl').
gilmore_girls(Start,End) :- begin('gilmore_girls',_,_,Start), end('gilmore_girls',_,_,End), Start=<End.

harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

generate_facts_gilmore_girls_AND_harry_potter([]) :- assert(gilmore_girls_AND_harry_potter(-1,-1)).

generate_facts_gilmore_girls_AND_harry_potter([(Start,End) | Tail]) :- assert(gilmore_girls_AND_harry_potter(Start,End)), generate_facts_gilmore_girls_AND_harry_potter(Tail).

gilmore_girls_AND_harry_potter_aux() :- findall((Start,End),gilmore_girls(Start,End),Interval1), findall((Start,End),harry_potter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_gilmore_girls_AND_harry_potter(Interval).

gilmore_girls_AND_harry_potter_at_2007(Res) :- setof((Start,End),gilmore_girls_AND_harry_potter(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = gilmore_girls_AND_harry_potter_at_2007'), (gilmore_girls_AND_harry_potter_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gilmore_girls_AND_harry_potter_aux().

