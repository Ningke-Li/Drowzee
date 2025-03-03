:- include('database.pl').
cristero_war(Start,End) :- begin('cristero_war',_,_,Start), end('cristero_war',_,_,End), Start=<End.

teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

generate_facts_cristero_war_OR_teen_titans([]) :- assert(cristero_war_OR_teen_titans(-1,-1)).

generate_facts_cristero_war_OR_teen_titans([(Start,End) | Tail]) :- assert(cristero_war_OR_teen_titans(Start,End)), generate_facts_cristero_war_OR_teen_titans(Tail).

cristero_war_OR_teen_titans_aux() :- findall((Start,End),cristero_war(Start,End),Interval1), findall((Start,End),teen_titans(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cristero_war_OR_teen_titans(Interval).

cristero_war_OR_teen_titans_at_1928(Res) :- setof((Start,End),cristero_war_OR_teen_titans(Start,End),AllINtervals), checkvalidity(1928,AllINtervals,Res).

check_query() :- write('Query = cristero_war_OR_teen_titans_at_1928'), (cristero_war_OR_teen_titans_at_1928(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cristero_war_OR_teen_titans_aux().

