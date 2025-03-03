:- include('database.pl').
gossip_girl(Start,End) :- begin('gossip_girl',_,_,Start), end('gossip_girl',_,_,End), Start=<End.

uefa_euro_2012_qualifying_group_a(Start,End) :- begin('uefa_euro_2012_qualifying_group_a',_,_,Start), end('uefa_euro_2012_qualifying_group_a',_,_,End), Start=<End.

generate_facts_gossip_girl_AND_uefa_euro_2012_qualifying_group_a([]) :- assert(gossip_girl_AND_uefa_euro_2012_qualifying_group_a(-1,-1)).

generate_facts_gossip_girl_AND_uefa_euro_2012_qualifying_group_a([(Start,End) | Tail]) :- assert(gossip_girl_AND_uefa_euro_2012_qualifying_group_a(Start,End)), generate_facts_gossip_girl_AND_uefa_euro_2012_qualifying_group_a(Tail).

gossip_girl_AND_uefa_euro_2012_qualifying_group_a_aux() :- findall((Start,End),gossip_girl(Start,End),Interval1), findall((Start,End),uefa_euro_2012_qualifying_group_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_gossip_girl_AND_uefa_euro_2012_qualifying_group_a(Interval).

gossip_girl_AND_uefa_euro_2012_qualifying_group_a_at_1954(Res) :- setof((Start,End),gossip_girl_AND_uefa_euro_2012_qualifying_group_a(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = gossip_girl_AND_uefa_euro_2012_qualifying_group_a_at_1954'), (gossip_girl_AND_uefa_euro_2012_qualifying_group_a_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gossip_girl_AND_uefa_euro_2012_qualifying_group_a_aux().

