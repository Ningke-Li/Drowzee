:- include('database.pl').
community(Start,End) :- begin('community',_,_,Start), end('community',_,_,End), Start=<End.

under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

generate_facts_community_AND_under_the_dome([]) :- assert(community_AND_under_the_dome(-1,-1)).

generate_facts_community_AND_under_the_dome([(Start,End) | Tail]) :- assert(community_AND_under_the_dome(Start,End)), generate_facts_community_AND_under_the_dome(Tail).

community_AND_under_the_dome_aux() :- findall((Start,End),community(Start,End),Interval1), findall((Start,End),under_the_dome(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_community_AND_under_the_dome(Interval).

community_AND_under_the_dome_at_1945(Res) :- setof((Start,End),community_AND_under_the_dome(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = community_AND_under_the_dome_at_1945'), (community_AND_under_the_dome_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- community_AND_under_the_dome_aux().

