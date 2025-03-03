:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

generate_facts_ncis__new_orleans_AND_veronica_mars([]) :- assert(ncis__new_orleans_AND_veronica_mars(-1,-1)).

generate_facts_ncis__new_orleans_AND_veronica_mars([(Start,End) | Tail]) :- assert(ncis__new_orleans_AND_veronica_mars(Start,End)), generate_facts_ncis__new_orleans_AND_veronica_mars(Tail).

ncis__new_orleans_AND_veronica_mars_aux() :- findall((Start,End),ncis__new_orleans(Start,End),Interval1), findall((Start,End),veronica_mars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ncis__new_orleans_AND_veronica_mars(Interval).

ncis__new_orleans_AND_veronica_mars_at_2018(Res) :- setof((Start,End),ncis__new_orleans_AND_veronica_mars(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = ncis__new_orleans_AND_veronica_mars_at_2018'), (ncis__new_orleans_AND_veronica_mars_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ncis__new_orleans_AND_veronica_mars_aux().

