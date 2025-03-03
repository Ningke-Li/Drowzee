:- include('database.pl').
wuchang_uprising(Start,End) :- begin('wuchang_uprising',_,_,Start), end('wuchang_uprising',_,_,End), Start=<End.

star_trek__enterprise(Start,End) :- begin('star_trek__enterprise',_,_,Start), end('star_trek__enterprise',_,_,End), Start=<End.

generate_facts_wuchang_uprising_OR_star_trek__enterprise([]) :- assert(wuchang_uprising_OR_star_trek__enterprise(-1,-1)).

generate_facts_wuchang_uprising_OR_star_trek__enterprise([(Start,End) | Tail]) :- assert(wuchang_uprising_OR_star_trek__enterprise(Start,End)), generate_facts_wuchang_uprising_OR_star_trek__enterprise(Tail).

wuchang_uprising_OR_star_trek__enterprise_aux() :- findall((Start,End),wuchang_uprising(Start,End),Interval1), findall((Start,End),star_trek__enterprise(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_wuchang_uprising_OR_star_trek__enterprise(Interval).

wuchang_uprising_OR_star_trek__enterprise_at_2004(Res) :- setof((Start,End),wuchang_uprising_OR_star_trek__enterprise(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = wuchang_uprising_OR_star_trek__enterprise_at_2004'), (wuchang_uprising_OR_star_trek__enterprise_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wuchang_uprising_OR_star_trek__enterprise_aux().

