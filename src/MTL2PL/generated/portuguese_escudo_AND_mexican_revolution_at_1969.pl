:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

mexican_revolution(Start,End) :- begin('mexican_revolution',_,_,Start), end('mexican_revolution',_,_,End), Start=<End.

generate_facts_portuguese_escudo_AND_mexican_revolution([]) :- assert(portuguese_escudo_AND_mexican_revolution(-1,-1)).

generate_facts_portuguese_escudo_AND_mexican_revolution([(Start,End) | Tail]) :- assert(portuguese_escudo_AND_mexican_revolution(Start,End)), generate_facts_portuguese_escudo_AND_mexican_revolution(Tail).

portuguese_escudo_AND_mexican_revolution_aux() :- findall((Start,End),portuguese_escudo(Start,End),Interval1), findall((Start,End),mexican_revolution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_portuguese_escudo_AND_mexican_revolution(Interval).

portuguese_escudo_AND_mexican_revolution_at_1969(Res) :- setof((Start,End),portuguese_escudo_AND_mexican_revolution(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = portuguese_escudo_AND_mexican_revolution_at_1969'), (portuguese_escudo_AND_mexican_revolution_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).
?- portuguese_escudo_AND_mexican_revolution_aux().

