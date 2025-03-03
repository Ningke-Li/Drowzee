:- include('database.pl').
september_massacres(Start,End) :- begin('september_massacres',_,_,Start), end('september_massacres',_,_,End), Start=<End.

great_irish_famine(Start,End) :- begin('great_irish_famine',_,_,Start), end('great_irish_famine',_,_,End), Start=<End.

generate_facts_september_massacres_OR_great_irish_famine([]) :- assert(september_massacres_OR_great_irish_famine(-1,-1)).

generate_facts_september_massacres_OR_great_irish_famine([(Start,End) | Tail]) :- assert(september_massacres_OR_great_irish_famine(Start,End)), generate_facts_september_massacres_OR_great_irish_famine(Tail).

september_massacres_OR_great_irish_famine_aux() :- findall((Start,End),september_massacres(Start,End),Interval1), findall((Start,End),great_irish_famine(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_september_massacres_OR_great_irish_famine(Interval).

september_massacres_OR_great_irish_famine_at_1863(Res) :- setof((Start,End),september_massacres_OR_great_irish_famine(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = september_massacres_OR_great_irish_famine_at_1863'), (september_massacres_OR_great_irish_famine_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- september_massacres_OR_great_irish_famine_aux().

