:- include('database.pl').
ev_2014_15_la_liga(Start,End) :- begin('ev_2014_15_la_liga',_,_,Start), end('ev_2014_15_la_liga',_,_,End), Start=<End.

second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

generate_facts_ev_2014_15_la_liga_AND_second_libyan_civil_war([]) :- assert(ev_2014_15_la_liga_AND_second_libyan_civil_war(-1,-1)).

generate_facts_ev_2014_15_la_liga_AND_second_libyan_civil_war([(Start,End) | Tail]) :- assert(ev_2014_15_la_liga_AND_second_libyan_civil_war(Start,End)), generate_facts_ev_2014_15_la_liga_AND_second_libyan_civil_war(Tail).

ev_2014_15_la_liga_AND_second_libyan_civil_war_aux() :- findall((Start,End),ev_2014_15_la_liga(Start,End),Interval1), findall((Start,End),second_libyan_civil_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2014_15_la_liga_AND_second_libyan_civil_war(Interval).

ev_2014_15_la_liga_AND_second_libyan_civil_war_at_1940(Res) :- setof((Start,End),ev_2014_15_la_liga_AND_second_libyan_civil_war(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = ev_2014_15_la_liga_AND_second_libyan_civil_war_at_1940'), (ev_2014_15_la_liga_AND_second_libyan_civil_war_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_15_la_liga_AND_second_libyan_civil_war_aux().

