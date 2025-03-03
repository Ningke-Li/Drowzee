:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

arrow(Start,End) :- begin('arrow',_,_,Start), end('arrow',_,_,End), Start=<End.

generate_facts_lazytown_OR_arrow([]) :- assert(lazytown_OR_arrow(-1,-1)).

generate_facts_lazytown_OR_arrow([(Start,End) | Tail]) :- assert(lazytown_OR_arrow(Start,End)), generate_facts_lazytown_OR_arrow(Tail).

lazytown_OR_arrow_aux() :- findall((Start,End),lazytown(Start,End),Interval1), findall((Start,End),arrow(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_lazytown_OR_arrow(Interval).

lazytown_OR_arrow_at_1984(Res) :- setof((Start,End),lazytown_OR_arrow(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = lazytown_OR_arrow_at_1984'), (lazytown_OR_arrow_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lazytown_OR_arrow_aux().

