:- include('database.pl').
war_communism(Start,End) :- begin('war_communism',_,_,Start), end('war_communism',_,_,End), Start=<End.

ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

generate_facts_war_communism_OR_ev_20th_century([]) :- assert(war_communism_OR_ev_20th_century(-1,-1)).

generate_facts_war_communism_OR_ev_20th_century([(Start,End) | Tail]) :- assert(war_communism_OR_ev_20th_century(Start,End)), generate_facts_war_communism_OR_ev_20th_century(Tail).

war_communism_OR_ev_20th_century_aux() :- findall((Start,End),war_communism(Start,End),Interval1), findall((Start,End),ev_20th_century(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_communism_OR_ev_20th_century(Interval).

war_communism_OR_ev_20th_century_at_1878(Res) :- setof((Start,End),war_communism_OR_ev_20th_century(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = war_communism_OR_ev_20th_century_at_1878'), (war_communism_OR_ev_20th_century_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_communism_OR_ev_20th_century_aux().

