:- include('database.pl').
ev_1948_palestine_war(Start,End) :- begin('ev_1948_palestine_war',_,_,Start), end('ev_1948_palestine_war',_,_,End), Start=<End.

woody_woodpecker(Start,End) :- begin('woody_woodpecker',_,_,Start), end('woody_woodpecker',_,_,End), Start=<End.

generate_facts_ev_1948_palestine_war_AND_woody_woodpecker([]) :- assert(ev_1948_palestine_war_AND_woody_woodpecker(-1,-1)).

generate_facts_ev_1948_palestine_war_AND_woody_woodpecker([(Start,End) | Tail]) :- assert(ev_1948_palestine_war_AND_woody_woodpecker(Start,End)), generate_facts_ev_1948_palestine_war_AND_woody_woodpecker(Tail).

ev_1948_palestine_war_AND_woody_woodpecker_aux() :- findall((Start,End),ev_1948_palestine_war(Start,End),Interval1), findall((Start,End),woody_woodpecker(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1948_palestine_war_AND_woody_woodpecker(Interval).

ev_1948_palestine_war_AND_woody_woodpecker_at_1972(Res) :- setof((Start,End),ev_1948_palestine_war_AND_woody_woodpecker(Start,End),AllINtervals), checkvalidity(1972,AllINtervals,Res).

check_query() :- write('Query = ev_1948_palestine_war_AND_woody_woodpecker_at_1972'), (ev_1948_palestine_war_AND_woody_woodpecker_at_1972(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1948_palestine_war_AND_woody_woodpecker_aux().

