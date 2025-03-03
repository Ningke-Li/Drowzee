:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

generate_facts_estonian_kroon_AND_portuguese_escudo([]) :- assert(estonian_kroon_AND_portuguese_escudo(-1,-1)).

generate_facts_estonian_kroon_AND_portuguese_escudo([(Start,End) | Tail]) :- assert(estonian_kroon_AND_portuguese_escudo(Start,End)), generate_facts_estonian_kroon_AND_portuguese_escudo(Tail).

estonian_kroon_AND_portuguese_escudo_aux() :- findall((Start,End),estonian_kroon(Start,End),Interval1), findall((Start,End),portuguese_escudo(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_estonian_kroon_AND_portuguese_escudo(Interval).

estonian_kroon_AND_portuguese_escudo_at_1997(Res) :- setof((Start,End),estonian_kroon_AND_portuguese_escudo(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = estonian_kroon_AND_portuguese_escudo_at_1997'), (estonian_kroon_AND_portuguese_escudo_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).
?- estonian_kroon_AND_portuguese_escudo_aux().

