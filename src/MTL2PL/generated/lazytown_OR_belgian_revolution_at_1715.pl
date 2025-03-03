:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

belgian_revolution(Start,End) :- begin('belgian_revolution',_,_,Start), end('belgian_revolution',_,_,End), Start=<End.

generate_facts_lazytown_OR_belgian_revolution([]) :- assert(lazytown_OR_belgian_revolution(-1,-1)).

generate_facts_lazytown_OR_belgian_revolution([(Start,End) | Tail]) :- assert(lazytown_OR_belgian_revolution(Start,End)), generate_facts_lazytown_OR_belgian_revolution(Tail).

lazytown_OR_belgian_revolution_aux() :- findall((Start,End),lazytown(Start,End),Interval1), findall((Start,End),belgian_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_lazytown_OR_belgian_revolution(Interval).

lazytown_OR_belgian_revolution_at_1715(Res) :- setof((Start,End),lazytown_OR_belgian_revolution(Start,End),AllINtervals), checkvalidity(1715,AllINtervals,Res).

check_query() :- write('Query = lazytown_OR_belgian_revolution_at_1715'), (lazytown_OR_belgian_revolution_at_1715(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lazytown_OR_belgian_revolution_aux().

