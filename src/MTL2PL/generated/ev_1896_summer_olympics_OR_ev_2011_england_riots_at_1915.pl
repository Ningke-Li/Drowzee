:- include('database.pl').
ev_1896_summer_olympics(Start,End) :- begin('ev_1896_summer_olympics',_,_,Start), end('ev_1896_summer_olympics',_,_,End), Start=<End.

ev_2011_england_riots(Start,End) :- begin('ev_2011_england_riots',_,_,Start), end('ev_2011_england_riots',_,_,End), Start=<End.

generate_facts_ev_1896_summer_olympics_OR_ev_2011_england_riots([]) :- assert(ev_1896_summer_olympics_OR_ev_2011_england_riots(-1,-1)).

generate_facts_ev_1896_summer_olympics_OR_ev_2011_england_riots([(Start,End) | Tail]) :- assert(ev_1896_summer_olympics_OR_ev_2011_england_riots(Start,End)), generate_facts_ev_1896_summer_olympics_OR_ev_2011_england_riots(Tail).

ev_1896_summer_olympics_OR_ev_2011_england_riots_aux() :- findall((Start,End),ev_1896_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2011_england_riots(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1896_summer_olympics_OR_ev_2011_england_riots(Interval).

ev_1896_summer_olympics_OR_ev_2011_england_riots_at_1915(Res) :- setof((Start,End),ev_1896_summer_olympics_OR_ev_2011_england_riots(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = ev_1896_summer_olympics_OR_ev_2011_england_riots_at_1915'), (ev_1896_summer_olympics_OR_ev_2011_england_riots_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1896_summer_olympics_OR_ev_2011_england_riots_aux().

