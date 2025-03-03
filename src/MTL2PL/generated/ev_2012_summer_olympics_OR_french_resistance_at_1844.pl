:- include('database.pl').
ev_2012_summer_olympics(Start,End) :- begin('ev_2012_summer_olympics',_,_,Start), end('ev_2012_summer_olympics',_,_,End), Start=<End.

french_resistance(Start,End) :- begin('french_resistance',_,_,Start), end('french_resistance',_,_,End), Start=<End.

generate_facts_ev_2012_summer_olympics_OR_french_resistance([]) :- assert(ev_2012_summer_olympics_OR_french_resistance(-1,-1)).

generate_facts_ev_2012_summer_olympics_OR_french_resistance([(Start,End) | Tail]) :- assert(ev_2012_summer_olympics_OR_french_resistance(Start,End)), generate_facts_ev_2012_summer_olympics_OR_french_resistance(Tail).

ev_2012_summer_olympics_OR_french_resistance_aux() :- findall((Start,End),ev_2012_summer_olympics(Start,End),Interval1), findall((Start,End),french_resistance(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_summer_olympics_OR_french_resistance(Interval).

ev_2012_summer_olympics_OR_french_resistance_at_1844(Res) :- setof((Start,End),ev_2012_summer_olympics_OR_french_resistance(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = ev_2012_summer_olympics_OR_french_resistance_at_1844'), (ev_2012_summer_olympics_OR_french_resistance_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_summer_olympics_OR_french_resistance_aux().

