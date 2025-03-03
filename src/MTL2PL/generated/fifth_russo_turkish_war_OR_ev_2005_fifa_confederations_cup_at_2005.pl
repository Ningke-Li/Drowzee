:- include('database.pl').
fifth_russo_turkish_war(Start,End) :- begin('fifth_russo_turkish_war',_,_,Start), end('fifth_russo_turkish_war',_,_,End), Start=<End.

ev_2005_fifa_confederations_cup(Start,End) :- begin('ev_2005_fifa_confederations_cup',_,_,Start), end('ev_2005_fifa_confederations_cup',_,_,End), Start=<End.

generate_facts_fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup([]) :- assert(fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup(-1,-1)).

generate_facts_fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup([(Start,End) | Tail]) :- assert(fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup(Start,End)), generate_facts_fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup(Tail).

fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup_aux() :- findall((Start,End),fifth_russo_turkish_war(Start,End),Interval1), findall((Start,End),ev_2005_fifa_confederations_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup(Interval).

fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup_at_2005(Res) :- setof((Start,End),fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup_at_2005'), (fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fifth_russo_turkish_war_OR_ev_2005_fifa_confederations_cup_aux().

