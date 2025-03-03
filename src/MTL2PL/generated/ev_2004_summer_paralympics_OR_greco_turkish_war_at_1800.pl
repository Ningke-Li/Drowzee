:- include('database.pl').
ev_2004_summer_paralympics(Start,End) :- begin('ev_2004_summer_paralympics',_,_,Start), end('ev_2004_summer_paralympics',_,_,End), Start=<End.

greco_turkish_war(Start,End) :- begin('greco_turkish_war',_,_,Start), end('greco_turkish_war',_,_,End), Start=<End.

generate_facts_ev_2004_summer_paralympics_OR_greco_turkish_war([]) :- assert(ev_2004_summer_paralympics_OR_greco_turkish_war(-1,-1)).

generate_facts_ev_2004_summer_paralympics_OR_greco_turkish_war([(Start,End) | Tail]) :- assert(ev_2004_summer_paralympics_OR_greco_turkish_war(Start,End)), generate_facts_ev_2004_summer_paralympics_OR_greco_turkish_war(Tail).

ev_2004_summer_paralympics_OR_greco_turkish_war_aux() :- findall((Start,End),ev_2004_summer_paralympics(Start,End),Interval1), findall((Start,End),greco_turkish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2004_summer_paralympics_OR_greco_turkish_war(Interval).

ev_2004_summer_paralympics_OR_greco_turkish_war_at_1800(Res) :- setof((Start,End),ev_2004_summer_paralympics_OR_greco_turkish_war(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = ev_2004_summer_paralympics_OR_greco_turkish_war_at_1800'), (ev_2004_summer_paralympics_OR_greco_turkish_war_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_summer_paralympics_OR_greco_turkish_war_aux().

