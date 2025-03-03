:- include('database.pl').
war_of_the_austrian_succession(Start,End) :- begin('war_of_the_austrian_succession',_,_,Start), end('war_of_the_austrian_succession',_,_,End), Start=<End.

ev_18th_century(Start,End) :- begin('ev_18th_century',_,_,Start), end('ev_18th_century',_,_,End), Start=<End.

generate_facts_war_of_the_austrian_succession_AND_ev_18th_century([]) :- assert(war_of_the_austrian_succession_AND_ev_18th_century(-1,-1)).

generate_facts_war_of_the_austrian_succession_AND_ev_18th_century([(Start,End) | Tail]) :- assert(war_of_the_austrian_succession_AND_ev_18th_century(Start,End)), generate_facts_war_of_the_austrian_succession_AND_ev_18th_century(Tail).

war_of_the_austrian_succession_AND_ev_18th_century_aux() :- findall((Start,End),war_of_the_austrian_succession(Start,End),Interval1), findall((Start,End),ev_18th_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_of_the_austrian_succession_AND_ev_18th_century(Interval).

war_of_the_austrian_succession_AND_ev_18th_century_at_1748(Res) :- setof((Start,End),war_of_the_austrian_succession_AND_ev_18th_century(Start,End),AllINtervals), checkvalidity(1748,AllINtervals,Res).

check_query() :- write('Query = war_of_the_austrian_succession_AND_ev_18th_century_at_1748'), (war_of_the_austrian_succession_AND_ev_18th_century_at_1748(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_austrian_succession_AND_ev_18th_century_aux().

