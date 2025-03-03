:- include('database.pl').
franklin_s_lost_expedition(Start,End) :- begin('franklin_s_lost_expedition',_,_,Start), end('franklin_s_lost_expedition',_,_,End), Start=<End.

the_blacklist(Start,End) :- begin('the_blacklist',_,_,Start), end('the_blacklist',_,_,End), Start=<End.

generate_facts_franklin_s_lost_expedition_OR_the_blacklist([]) :- assert(franklin_s_lost_expedition_OR_the_blacklist(-1,-1)).

generate_facts_franklin_s_lost_expedition_OR_the_blacklist([(Start,End) | Tail]) :- assert(franklin_s_lost_expedition_OR_the_blacklist(Start,End)), generate_facts_franklin_s_lost_expedition_OR_the_blacklist(Tail).

franklin_s_lost_expedition_OR_the_blacklist_aux() :- findall((Start,End),franklin_s_lost_expedition(Start,End),Interval1), findall((Start,End),the_blacklist(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_franklin_s_lost_expedition_OR_the_blacklist(Interval).

franklin_s_lost_expedition_OR_the_blacklist_at_1901(Res) :- setof((Start,End),franklin_s_lost_expedition_OR_the_blacklist(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = franklin_s_lost_expedition_OR_the_blacklist_at_1901'), (franklin_s_lost_expedition_OR_the_blacklist_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- franklin_s_lost_expedition_OR_the_blacklist_aux().

