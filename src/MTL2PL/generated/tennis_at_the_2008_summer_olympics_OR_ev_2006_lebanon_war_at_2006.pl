:- include('database.pl').
tennis_at_the_2008_summer_olympics(Start,End) :- begin('tennis_at_the_2008_summer_olympics',_,_,Start), end('tennis_at_the_2008_summer_olympics',_,_,End), Start=<End.

ev_2006_lebanon_war(Start,End) :- begin('ev_2006_lebanon_war',_,_,Start), end('ev_2006_lebanon_war',_,_,End), Start=<End.

generate_facts_tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war([]) :- assert(tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war(-1,-1)).

generate_facts_tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war([(Start,End) | Tail]) :- assert(tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war(Start,End)), generate_facts_tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war(Tail).

tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war_aux() :- findall((Start,End),tennis_at_the_2008_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2006_lebanon_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war(Interval).

tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war_at_2006(Res) :- setof((Start,End),tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war_at_2006'), (tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tennis_at_the_2008_summer_olympics_OR_ev_2006_lebanon_war_aux().

