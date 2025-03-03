:- include('database.pl').
medcezir(Start,End) :- begin('medcezir',_,_,Start), end('medcezir',_,_,End), Start=<End.

ev_2010_eruptions_of_eyjafjallaj_kull(Start,End) :- begin('ev_2010_eruptions_of_eyjafjallaj_kull',_,_,Start), end('ev_2010_eruptions_of_eyjafjallaj_kull',_,_,End), Start=<End.

generate_facts_medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull([]) :- assert(medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull(-1,-1)).

generate_facts_medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull([(Start,End) | Tail]) :- assert(medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull(Start,End)), generate_facts_medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull(Tail).

medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull_aux() :- findall((Start,End),medcezir(Start,End),Interval1), findall((Start,End),ev_2010_eruptions_of_eyjafjallaj_kull(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull(Interval).

medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull_at_1987(Res) :- setof((Start,End),medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull_at_1987'), (medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).
?- medcezir_OR_ev_2010_eruptions_of_eyjafjallaj_kull_aux().

