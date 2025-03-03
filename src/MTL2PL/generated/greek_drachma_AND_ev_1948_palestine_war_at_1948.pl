:- include('database.pl').
greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

ev_1948_palestine_war(Start,End) :- begin('ev_1948_palestine_war',_,_,Start), end('ev_1948_palestine_war',_,_,End), Start=<End.

generate_facts_greek_drachma_AND_ev_1948_palestine_war([]) :- assert(greek_drachma_AND_ev_1948_palestine_war(-1,-1)).

generate_facts_greek_drachma_AND_ev_1948_palestine_war([(Start,End) | Tail]) :- assert(greek_drachma_AND_ev_1948_palestine_war(Start,End)), generate_facts_greek_drachma_AND_ev_1948_palestine_war(Tail).

greek_drachma_AND_ev_1948_palestine_war_aux() :- findall((Start,End),greek_drachma(Start,End),Interval1), findall((Start,End),ev_1948_palestine_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_greek_drachma_AND_ev_1948_palestine_war(Interval).

greek_drachma_AND_ev_1948_palestine_war_at_1948(Res) :- setof((Start,End),greek_drachma_AND_ev_1948_palestine_war(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = greek_drachma_AND_ev_1948_palestine_war_at_1948'), (greek_drachma_AND_ev_1948_palestine_war_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_drachma_AND_ev_1948_palestine_war_aux().

