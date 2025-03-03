:- include('database.pl').
ev_2013_14_serie_a(Start,End) :- begin('ev_2013_14_serie_a',_,_,Start), end('ev_2013_14_serie_a',_,_,End), Start=<End.

second_russo_turkish_war(Start,End) :- begin('second_russo_turkish_war',_,_,Start), end('second_russo_turkish_war',_,_,End), Start=<End.

generate_facts_ev_2013_14_serie_a_OR_second_russo_turkish_war([]) :- assert(ev_2013_14_serie_a_OR_second_russo_turkish_war(-1,-1)).

generate_facts_ev_2013_14_serie_a_OR_second_russo_turkish_war([(Start,End) | Tail]) :- assert(ev_2013_14_serie_a_OR_second_russo_turkish_war(Start,End)), generate_facts_ev_2013_14_serie_a_OR_second_russo_turkish_war(Tail).

ev_2013_14_serie_a_OR_second_russo_turkish_war_aux() :- findall((Start,End),ev_2013_14_serie_a(Start,End),Interval1), findall((Start,End),second_russo_turkish_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_14_serie_a_OR_second_russo_turkish_war(Interval).

ev_2013_14_serie_a_OR_second_russo_turkish_war_at_1570(Res) :- setof((Start,End),ev_2013_14_serie_a_OR_second_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1570,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_serie_a_OR_second_russo_turkish_war_at_1570'), (ev_2013_14_serie_a_OR_second_russo_turkish_war_at_1570(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_serie_a_OR_second_russo_turkish_war_aux().

