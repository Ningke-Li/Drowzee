:- include('database.pl').
ninth_russo_turkish_war(Start,End) :- begin('ninth_russo_turkish_war',_,_,Start), end('ninth_russo_turkish_war',_,_,End), Start=<End.

ev_2014_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2014_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

generate_facts_ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_([]) :- assert(ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_(-1,-1)).

generate_facts_ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End)), generate_facts_ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Tail).

ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol__aux() :- findall((Start,End),ninth_russo_turkish_war(Start,End),Interval1), findall((Start,End),ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Interval).

ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_1828(Res) :- setof((Start,End),ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_1828'), (ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol__at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ninth_russo_turkish_war_OR_ev_2014_fifa_world_cup_qualification__conmebol__aux().

