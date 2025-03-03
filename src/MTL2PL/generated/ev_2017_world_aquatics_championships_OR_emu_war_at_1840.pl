:- include('database.pl').
ev_2017_world_aquatics_championships(Start,End) :- begin('ev_2017_world_aquatics_championships',_,_,Start), end('ev_2017_world_aquatics_championships',_,_,End), Start=<End.

emu_war(Start,End) :- begin('emu_war',_,_,Start), end('emu_war',_,_,End), Start=<End.

generate_facts_ev_2017_world_aquatics_championships_OR_emu_war([]) :- assert(ev_2017_world_aquatics_championships_OR_emu_war(-1,-1)).

generate_facts_ev_2017_world_aquatics_championships_OR_emu_war([(Start,End) | Tail]) :- assert(ev_2017_world_aquatics_championships_OR_emu_war(Start,End)), generate_facts_ev_2017_world_aquatics_championships_OR_emu_war(Tail).

ev_2017_world_aquatics_championships_OR_emu_war_aux() :- findall((Start,End),ev_2017_world_aquatics_championships(Start,End),Interval1), findall((Start,End),emu_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_world_aquatics_championships_OR_emu_war(Interval).

ev_2017_world_aquatics_championships_OR_emu_war_at_1840(Res) :- setof((Start,End),ev_2017_world_aquatics_championships_OR_emu_war(Start,End),AllINtervals), checkvalidity(1840,AllINtervals,Res).

check_query() :- write('Query = ev_2017_world_aquatics_championships_OR_emu_war_at_1840'), (ev_2017_world_aquatics_championships_OR_emu_war_at_1840(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_world_aquatics_championships_OR_emu_war_aux().

