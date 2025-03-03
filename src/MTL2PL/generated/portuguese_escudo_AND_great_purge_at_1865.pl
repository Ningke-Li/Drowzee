:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

great_purge(Start,End) :- begin('great_purge',_,_,Start), end('great_purge',_,_,End), Start=<End.

generate_facts_portuguese_escudo_AND_great_purge([]) :- assert(portuguese_escudo_AND_great_purge(-1,-1)).

generate_facts_portuguese_escudo_AND_great_purge([(Start,End) | Tail]) :- assert(portuguese_escudo_AND_great_purge(Start,End)), generate_facts_portuguese_escudo_AND_great_purge(Tail).

portuguese_escudo_AND_great_purge_aux() :- findall((Start,End),portuguese_escudo(Start,End),Interval1), findall((Start,End),great_purge(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_portuguese_escudo_AND_great_purge(Interval).

portuguese_escudo_AND_great_purge_at_1865(Res) :- setof((Start,End),portuguese_escudo_AND_great_purge(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = portuguese_escudo_AND_great_purge_at_1865'), (portuguese_escudo_AND_great_purge_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).
?- portuguese_escudo_AND_great_purge_aux().

