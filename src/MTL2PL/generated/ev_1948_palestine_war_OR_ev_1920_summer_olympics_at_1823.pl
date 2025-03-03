:- include('database.pl').
ev_1948_palestine_war(Start,End) :- begin('ev_1948_palestine_war',_,_,Start), end('ev_1948_palestine_war',_,_,End), Start=<End.

ev_1920_summer_olympics(Start,End) :- begin('ev_1920_summer_olympics',_,_,Start), end('ev_1920_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_1948_palestine_war_OR_ev_1920_summer_olympics([]) :- assert(ev_1948_palestine_war_OR_ev_1920_summer_olympics(-1,-1)).

generate_facts_ev_1948_palestine_war_OR_ev_1920_summer_olympics([(Start,End) | Tail]) :- assert(ev_1948_palestine_war_OR_ev_1920_summer_olympics(Start,End)), generate_facts_ev_1948_palestine_war_OR_ev_1920_summer_olympics(Tail).

ev_1948_palestine_war_OR_ev_1920_summer_olympics_aux() :- findall((Start,End),ev_1948_palestine_war(Start,End),Interval1), findall((Start,End),ev_1920_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1948_palestine_war_OR_ev_1920_summer_olympics(Interval).

ev_1948_palestine_war_OR_ev_1920_summer_olympics_at_1823(Res) :- setof((Start,End),ev_1948_palestine_war_OR_ev_1920_summer_olympics(Start,End),AllINtervals), checkvalidity(1823,AllINtervals,Res).

check_query() :- write('Query = ev_1948_palestine_war_OR_ev_1920_summer_olympics_at_1823'), (ev_1948_palestine_war_OR_ev_1920_summer_olympics_at_1823(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1948_palestine_war_OR_ev_1920_summer_olympics_aux().

