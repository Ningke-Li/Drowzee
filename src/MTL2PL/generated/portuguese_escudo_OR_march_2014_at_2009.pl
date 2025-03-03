:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

march_2014(Start,End) :- begin('march_2014',_,_,Start), end('march_2014',_,_,End), Start=<End.

generate_facts_portuguese_escudo_OR_march_2014([]) :- assert(portuguese_escudo_OR_march_2014(-1,-1)).

generate_facts_portuguese_escudo_OR_march_2014([(Start,End) | Tail]) :- assert(portuguese_escudo_OR_march_2014(Start,End)), generate_facts_portuguese_escudo_OR_march_2014(Tail).

portuguese_escudo_OR_march_2014_aux() :- findall((Start,End),portuguese_escudo(Start,End),Interval1), findall((Start,End),march_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_portuguese_escudo_OR_march_2014(Interval).

portuguese_escudo_OR_march_2014_at_2009(Res) :- setof((Start,End),portuguese_escudo_OR_march_2014(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = portuguese_escudo_OR_march_2014_at_2009'), (portuguese_escudo_OR_march_2014_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- portuguese_escudo_OR_march_2014_aux().

