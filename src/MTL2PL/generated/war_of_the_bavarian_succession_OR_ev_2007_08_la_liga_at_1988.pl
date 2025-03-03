:- include('database.pl').
war_of_the_bavarian_succession(Start,End) :- begin('war_of_the_bavarian_succession',_,_,Start), end('war_of_the_bavarian_succession',_,_,End), Start=<End.

ev_2007_08_la_liga(Start,End) :- begin('ev_2007_08_la_liga',_,_,Start), end('ev_2007_08_la_liga',_,_,End), Start=<End.

generate_facts_war_of_the_bavarian_succession_OR_ev_2007_08_la_liga([]) :- assert(war_of_the_bavarian_succession_OR_ev_2007_08_la_liga(-1,-1)).

generate_facts_war_of_the_bavarian_succession_OR_ev_2007_08_la_liga([(Start,End) | Tail]) :- assert(war_of_the_bavarian_succession_OR_ev_2007_08_la_liga(Start,End)), generate_facts_war_of_the_bavarian_succession_OR_ev_2007_08_la_liga(Tail).

war_of_the_bavarian_succession_OR_ev_2007_08_la_liga_aux() :- findall((Start,End),war_of_the_bavarian_succession(Start,End),Interval1), findall((Start,End),ev_2007_08_la_liga(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_of_the_bavarian_succession_OR_ev_2007_08_la_liga(Interval).

war_of_the_bavarian_succession_OR_ev_2007_08_la_liga_at_1988(Res) :- setof((Start,End),war_of_the_bavarian_succession_OR_ev_2007_08_la_liga(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = war_of_the_bavarian_succession_OR_ev_2007_08_la_liga_at_1988'), (war_of_the_bavarian_succession_OR_ev_2007_08_la_liga_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_bavarian_succession_OR_ev_2007_08_la_liga_aux().

