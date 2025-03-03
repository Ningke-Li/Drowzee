:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

ev_1948_arab_israeli_war(Start,End) :- begin('ev_1948_arab_israeli_war',_,_,Start), end('ev_1948_arab_israeli_war',_,_,End), Start=<End.

generate_facts_french_franc_AND_ev_1948_arab_israeli_war([]) :- assert(french_franc_AND_ev_1948_arab_israeli_war(-1,-1)).

generate_facts_french_franc_AND_ev_1948_arab_israeli_war([(Start,End) | Tail]) :- assert(french_franc_AND_ev_1948_arab_israeli_war(Start,End)), generate_facts_french_franc_AND_ev_1948_arab_israeli_war(Tail).

french_franc_AND_ev_1948_arab_israeli_war_aux() :- findall((Start,End),french_franc(Start,End),Interval1), findall((Start,End),ev_1948_arab_israeli_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_french_franc_AND_ev_1948_arab_israeli_war(Interval).

french_franc_AND_ev_1948_arab_israeli_war_at_1886(Res) :- setof((Start,End),french_franc_AND_ev_1948_arab_israeli_war(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = french_franc_AND_ev_1948_arab_israeli_war_at_1886'), (french_franc_AND_ev_1948_arab_israeli_war_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_franc_AND_ev_1948_arab_israeli_war_aux().

