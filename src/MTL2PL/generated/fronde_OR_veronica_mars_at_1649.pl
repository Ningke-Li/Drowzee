:- include('database.pl').
fronde(Start,End) :- begin('fronde',_,_,Start), end('fronde',_,_,End), Start=<End.

veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

generate_facts_fronde_OR_veronica_mars([]) :- assert(fronde_OR_veronica_mars(-1,-1)).

generate_facts_fronde_OR_veronica_mars([(Start,End) | Tail]) :- assert(fronde_OR_veronica_mars(Start,End)), generate_facts_fronde_OR_veronica_mars(Tail).

fronde_OR_veronica_mars_aux() :- findall((Start,End),fronde(Start,End),Interval1), findall((Start,End),veronica_mars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fronde_OR_veronica_mars(Interval).

fronde_OR_veronica_mars_at_1649(Res) :- setof((Start,End),fronde_OR_veronica_mars(Start,End),AllINtervals), checkvalidity(1649,AllINtervals,Res).

check_query() :- write('Query = fronde_OR_veronica_mars_at_1649'), (fronde_OR_veronica_mars_at_1649(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fronde_OR_veronica_mars_aux().

