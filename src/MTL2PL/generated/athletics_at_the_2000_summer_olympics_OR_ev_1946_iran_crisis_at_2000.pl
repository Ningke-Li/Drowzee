:- include('database.pl').
athletics_at_the_2000_summer_olympics(Start,End) :- begin('athletics_at_the_2000_summer_olympics',_,_,Start), end('athletics_at_the_2000_summer_olympics',_,_,End), Start=<End.

ev_1946_iran_crisis(Start,End) :- begin('ev_1946_iran_crisis',_,_,Start), end('ev_1946_iran_crisis',_,_,End), Start=<End.

generate_facts_athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis([]) :- assert(athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis(-1,-1)).

generate_facts_athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis([(Start,End) | Tail]) :- assert(athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis(Start,End)), generate_facts_athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis(Tail).

athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis_aux() :- findall((Start,End),athletics_at_the_2000_summer_olympics(Start,End),Interval1), findall((Start,End),ev_1946_iran_crisis(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis(Interval).

athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis_at_2000(Res) :- setof((Start,End),athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis_at_2000'), (athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).
?- athletics_at_the_2000_summer_olympics_OR_ev_1946_iran_crisis_aux().

