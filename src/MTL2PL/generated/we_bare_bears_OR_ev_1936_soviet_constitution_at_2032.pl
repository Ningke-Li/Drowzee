:- include('database.pl').
we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

generate_facts_we_bare_bears_OR_ev_1936_soviet_constitution([]) :- assert(we_bare_bears_OR_ev_1936_soviet_constitution(-1,-1)).

generate_facts_we_bare_bears_OR_ev_1936_soviet_constitution([(Start,End) | Tail]) :- assert(we_bare_bears_OR_ev_1936_soviet_constitution(Start,End)), generate_facts_we_bare_bears_OR_ev_1936_soviet_constitution(Tail).

we_bare_bears_OR_ev_1936_soviet_constitution_aux() :- findall((Start,End),we_bare_bears(Start,End),Interval1), findall((Start,End),ev_1936_soviet_constitution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_we_bare_bears_OR_ev_1936_soviet_constitution(Interval).

we_bare_bears_OR_ev_1936_soviet_constitution_at_2032(Res) :- setof((Start,End),we_bare_bears_OR_ev_1936_soviet_constitution(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = we_bare_bears_OR_ev_1936_soviet_constitution_at_2032'), (we_bare_bears_OR_ev_1936_soviet_constitution_at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).
?- we_bare_bears_OR_ev_1936_soviet_constitution_aux().

