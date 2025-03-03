:- include('database.pl').
russo_georgian_war(Start,End) :- begin('russo_georgian_war',_,_,Start), end('russo_georgian_war',_,_,End), Start=<End.

gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

generate_facts_russo_georgian_war_OR_gossip_girl([]) :- assert(russo_georgian_war_OR_gossip_girl(-1,-1)).

generate_facts_russo_georgian_war_OR_gossip_girl([(Start,End) | Tail]) :- assert(russo_georgian_war_OR_gossip_girl(Start,End)), generate_facts_russo_georgian_war_OR_gossip_girl(Tail).

russo_georgian_war_OR_gossip_girl_aux() :- findall((Start,End),russo_georgian_war(Start,End),Interval1), findall((Start,End),gossip_girl(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_russo_georgian_war_OR_gossip_girl(Interval).

russo_georgian_war_OR_gossip_girl_at_1961(Res) :- setof((Start,End),russo_georgian_war_OR_gossip_girl(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = russo_georgian_war_OR_gossip_girl_at_1961'), (russo_georgian_war_OR_gossip_girl_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).
?- russo_georgian_war_OR_gossip_girl_aux().

