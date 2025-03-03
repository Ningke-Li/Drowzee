:- include('database.pl').
ev_2015_16_serie_a(Start,End) :- begin('ev_2015_16_serie_a',_,_,Start), end('ev_2015_16_serie_a',_,_,End), Start=<End.

war_of_the_sixth_coalition(Start,End) :- begin('war_of_the_sixth_coalition',_,_,Start), end('war_of_the_sixth_coalition',_,_,End), Start=<End.

generate_facts_ev_2015_16_serie_a_OR_war_of_the_sixth_coalition([]) :- assert(ev_2015_16_serie_a_OR_war_of_the_sixth_coalition(-1,-1)).

generate_facts_ev_2015_16_serie_a_OR_war_of_the_sixth_coalition([(Start,End) | Tail]) :- assert(ev_2015_16_serie_a_OR_war_of_the_sixth_coalition(Start,End)), generate_facts_ev_2015_16_serie_a_OR_war_of_the_sixth_coalition(Tail).

ev_2015_16_serie_a_OR_war_of_the_sixth_coalition_aux() :- findall((Start,End),ev_2015_16_serie_a(Start,End),Interval1), findall((Start,End),war_of_the_sixth_coalition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_16_serie_a_OR_war_of_the_sixth_coalition(Interval).

ev_2015_16_serie_a_OR_war_of_the_sixth_coalition_at_1991(Res) :- setof((Start,End),ev_2015_16_serie_a_OR_war_of_the_sixth_coalition(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_serie_a_OR_war_of_the_sixth_coalition_at_1991'), (ev_2015_16_serie_a_OR_war_of_the_sixth_coalition_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_serie_a_OR_war_of_the_sixth_coalition_aux().

