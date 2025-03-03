:- include('database.pl').
ev_2006_lebanon_war(Start,End) :- begin('ev_2006_lebanon_war',_,_,Start), end('ev_2006_lebanon_war',_,_,End), Start=<End.

uefa_euro_2016_group_b(Start,End) :- begin('uefa_euro_2016_group_b',_,_,Start), end('uefa_euro_2016_group_b',_,_,End), Start=<End.

generate_facts_ev_2006_lebanon_war_OR_uefa_euro_2016_group_b([]) :- assert(ev_2006_lebanon_war_OR_uefa_euro_2016_group_b(-1,-1)).

generate_facts_ev_2006_lebanon_war_OR_uefa_euro_2016_group_b([(Start,End) | Tail]) :- assert(ev_2006_lebanon_war_OR_uefa_euro_2016_group_b(Start,End)), generate_facts_ev_2006_lebanon_war_OR_uefa_euro_2016_group_b(Tail).

ev_2006_lebanon_war_OR_uefa_euro_2016_group_b_aux() :- findall((Start,End),ev_2006_lebanon_war(Start,End),Interval1), findall((Start,End),uefa_euro_2016_group_b(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2006_lebanon_war_OR_uefa_euro_2016_group_b(Interval).

ev_2006_lebanon_war_OR_uefa_euro_2016_group_b_at_2055(Res) :- setof((Start,End),ev_2006_lebanon_war_OR_uefa_euro_2016_group_b(Start,End),AllINtervals), checkvalidity(2055,AllINtervals,Res).

check_query() :- write('Query = ev_2006_lebanon_war_OR_uefa_euro_2016_group_b_at_2055'), (ev_2006_lebanon_war_OR_uefa_euro_2016_group_b_at_2055(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2006_lebanon_war_OR_uefa_euro_2016_group_b_aux().

