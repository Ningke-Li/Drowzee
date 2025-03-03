:- include('database.pl').
ev_2_broke_girls(Start,End) :- begin('ev_2_broke_girls',_,_,Start), end('ev_2_broke_girls',_,_,End), Start=<End.

gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

generate_facts_ev_2_broke_girls_OR_gossip_girl([]) :- assert(ev_2_broke_girls_OR_gossip_girl(-1,-1)).

generate_facts_ev_2_broke_girls_OR_gossip_girl([(Start,End) | Tail]) :- assert(ev_2_broke_girls_OR_gossip_girl(Start,End)), generate_facts_ev_2_broke_girls_OR_gossip_girl(Tail).

ev_2_broke_girls_OR_gossip_girl_aux() :- findall((Start,End),ev_2_broke_girls(Start,End),Interval1), findall((Start,End),gossip_girl(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2_broke_girls_OR_gossip_girl(Interval).

ev_2_broke_girls_OR_gossip_girl_at_2014(Res) :- setof((Start,End),ev_2_broke_girls_OR_gossip_girl(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2_broke_girls_OR_gossip_girl_at_2014'), (ev_2_broke_girls_OR_gossip_girl_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2_broke_girls_OR_gossip_girl_aux().

