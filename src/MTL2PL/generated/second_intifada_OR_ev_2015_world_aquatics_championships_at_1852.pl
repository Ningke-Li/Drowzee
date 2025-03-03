:- include('database.pl').
second_intifada(Start,End) :- begin('second_intifada',_,_,Start), end('second_intifada',_,_,End), Start=<End.

ev_2015_world_aquatics_championships(Start,End) :- begin('ev_2015_world_aquatics_championships',_,_,Start), end('ev_2015_world_aquatics_championships',_,_,End), Start=<End.

generate_facts_second_intifada_OR_ev_2015_world_aquatics_championships([]) :- assert(second_intifada_OR_ev_2015_world_aquatics_championships(-1,-1)).

generate_facts_second_intifada_OR_ev_2015_world_aquatics_championships([(Start,End) | Tail]) :- assert(second_intifada_OR_ev_2015_world_aquatics_championships(Start,End)), generate_facts_second_intifada_OR_ev_2015_world_aquatics_championships(Tail).

second_intifada_OR_ev_2015_world_aquatics_championships_aux() :- findall((Start,End),second_intifada(Start,End),Interval1), findall((Start,End),ev_2015_world_aquatics_championships(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_intifada_OR_ev_2015_world_aquatics_championships(Interval).

second_intifada_OR_ev_2015_world_aquatics_championships_at_1852(Res) :- setof((Start,End),second_intifada_OR_ev_2015_world_aquatics_championships(Start,End),AllINtervals), checkvalidity(1852,AllINtervals,Res).

check_query() :- write('Query = second_intifada_OR_ev_2015_world_aquatics_championships_at_1852'), (second_intifada_OR_ev_2015_world_aquatics_championships_at_1852(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_intifada_OR_ev_2015_world_aquatics_championships_aux().

