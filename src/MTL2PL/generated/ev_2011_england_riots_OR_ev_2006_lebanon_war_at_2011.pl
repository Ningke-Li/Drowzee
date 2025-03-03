:- include('database.pl').
ev_2011_england_riots(Start,End) :- begin('ev_2011_england_riots',_,_,Start), end('ev_2011_england_riots',_,_,End), Start=<End.

ev_2006_lebanon_war(Start,End) :- begin('ev_2006_lebanon_war',_,_,Start), end('ev_2006_lebanon_war',_,_,End), Start=<End.

generate_facts_ev_2011_england_riots_OR_ev_2006_lebanon_war([]) :- assert(ev_2011_england_riots_OR_ev_2006_lebanon_war(-1,-1)).

generate_facts_ev_2011_england_riots_OR_ev_2006_lebanon_war([(Start,End) | Tail]) :- assert(ev_2011_england_riots_OR_ev_2006_lebanon_war(Start,End)), generate_facts_ev_2011_england_riots_OR_ev_2006_lebanon_war(Tail).

ev_2011_england_riots_OR_ev_2006_lebanon_war_aux() :- findall((Start,End),ev_2011_england_riots(Start,End),Interval1), findall((Start,End),ev_2006_lebanon_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_england_riots_OR_ev_2006_lebanon_war(Interval).

ev_2011_england_riots_OR_ev_2006_lebanon_war_at_2011(Res) :- setof((Start,End),ev_2011_england_riots_OR_ev_2006_lebanon_war(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ev_2011_england_riots_OR_ev_2006_lebanon_war_at_2011'), (ev_2011_england_riots_OR_ev_2006_lebanon_war_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_england_riots_OR_ev_2006_lebanon_war_aux().

