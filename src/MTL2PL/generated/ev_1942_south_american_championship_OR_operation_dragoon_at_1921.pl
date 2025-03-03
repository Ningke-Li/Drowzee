:- include('database.pl').
ev_1942_south_american_championship(Start,End) :- begin('ev_1942_south_american_championship',_,_,Start), end('ev_1942_south_american_championship',_,_,End), Start=<End.

operation_dragoon(Start,End) :- begin('operation_dragoon',_,_,Start), end('operation_dragoon',_,_,End), Start=<End.

generate_facts_ev_1942_south_american_championship_OR_operation_dragoon([]) :- assert(ev_1942_south_american_championship_OR_operation_dragoon(-1,-1)).

generate_facts_ev_1942_south_american_championship_OR_operation_dragoon([(Start,End) | Tail]) :- assert(ev_1942_south_american_championship_OR_operation_dragoon(Start,End)), generate_facts_ev_1942_south_american_championship_OR_operation_dragoon(Tail).

ev_1942_south_american_championship_OR_operation_dragoon_aux() :- findall((Start,End),ev_1942_south_american_championship(Start,End),Interval1), findall((Start,End),operation_dragoon(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1942_south_american_championship_OR_operation_dragoon(Interval).

ev_1942_south_american_championship_OR_operation_dragoon_at_1921(Res) :- setof((Start,End),ev_1942_south_american_championship_OR_operation_dragoon(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = ev_1942_south_american_championship_OR_operation_dragoon_at_1921'), (ev_1942_south_american_championship_OR_operation_dragoon_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1942_south_american_championship_OR_operation_dragoon_aux().

