:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

generate_facts_war_in_afghanistan_AND_csi__miami([]) :- assert(war_in_afghanistan_AND_csi__miami(-1,-1)).

generate_facts_war_in_afghanistan_AND_csi__miami([(Start,End) | Tail]) :- assert(war_in_afghanistan_AND_csi__miami(Start,End)), generate_facts_war_in_afghanistan_AND_csi__miami(Tail).

war_in_afghanistan_AND_csi__miami_aux() :- findall((Start,End),war_in_afghanistan(Start,End),Interval1), findall((Start,End),csi__miami(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_in_afghanistan_AND_csi__miami(Interval).

war_in_afghanistan_AND_csi__miami_at_1877(Res) :- setof((Start,End),war_in_afghanistan_AND_csi__miami(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_AND_csi__miami_at_1877'), (war_in_afghanistan_AND_csi__miami_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_in_afghanistan_AND_csi__miami_aux().

