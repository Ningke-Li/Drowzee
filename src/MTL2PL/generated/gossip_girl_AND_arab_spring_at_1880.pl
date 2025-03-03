:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

arab_spring(Start,End) :- begin('arab_spring',_,_,Start), end('arab_spring',_,_,End), Start=<End.

generate_facts_gossip_girl_AND_arab_spring([]) :- assert(gossip_girl_AND_arab_spring(-1,-1)).

generate_facts_gossip_girl_AND_arab_spring([(Start,End) | Tail]) :- assert(gossip_girl_AND_arab_spring(Start,End)), generate_facts_gossip_girl_AND_arab_spring(Tail).

gossip_girl_AND_arab_spring_aux() :- findall((Start,End),gossip_girl(Start,End),Interval1), findall((Start,End),arab_spring(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_gossip_girl_AND_arab_spring(Interval).

gossip_girl_AND_arab_spring_at_1880(Res) :- setof((Start,End),gossip_girl_AND_arab_spring(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = gossip_girl_AND_arab_spring_at_1880'), (gossip_girl_AND_arab_spring_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gossip_girl_AND_arab_spring_aux().

