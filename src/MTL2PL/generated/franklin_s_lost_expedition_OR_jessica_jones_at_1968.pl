:- include('database.pl').
franklin_s_lost_expedition(Start,End) :- begin('franklin_s_lost_expedition',_,_,Start), end('franklin_s_lost_expedition',_,_,End), Start=<End.

jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

generate_facts_franklin_s_lost_expedition_OR_jessica_jones([]) :- assert(franklin_s_lost_expedition_OR_jessica_jones(-1,-1)).

generate_facts_franklin_s_lost_expedition_OR_jessica_jones([(Start,End) | Tail]) :- assert(franklin_s_lost_expedition_OR_jessica_jones(Start,End)), generate_facts_franklin_s_lost_expedition_OR_jessica_jones(Tail).

franklin_s_lost_expedition_OR_jessica_jones_aux() :- findall((Start,End),franklin_s_lost_expedition(Start,End),Interval1), findall((Start,End),jessica_jones(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_franklin_s_lost_expedition_OR_jessica_jones(Interval).

franklin_s_lost_expedition_OR_jessica_jones_at_1968(Res) :- setof((Start,End),franklin_s_lost_expedition_OR_jessica_jones(Start,End),AllINtervals), checkvalidity(1968,AllINtervals,Res).

check_query() :- write('Query = franklin_s_lost_expedition_OR_jessica_jones_at_1968'), (franklin_s_lost_expedition_OR_jessica_jones_at_1968(true) -> write('\nRes   = true');write('\nRes   = false')).
?- franklin_s_lost_expedition_OR_jessica_jones_aux().

