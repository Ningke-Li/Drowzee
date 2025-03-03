:- include('database.pl').
berlin_blockade(Start,End) :- begin('berlin_blockade',_,_,Start), end('berlin_blockade',_,_,End), Start=<End.

tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

generate_facts_berlin_blockade_AND_tibet([]) :- assert(berlin_blockade_AND_tibet(-1,-1)).

generate_facts_berlin_blockade_AND_tibet([(Start,End) | Tail]) :- assert(berlin_blockade_AND_tibet(Start,End)), generate_facts_berlin_blockade_AND_tibet(Tail).

berlin_blockade_AND_tibet_aux() :- findall((Start,End),berlin_blockade(Start,End),Interval1), findall((Start,End),tibet(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_berlin_blockade_AND_tibet(Interval).

berlin_blockade_AND_tibet_at_1948(Res) :- setof((Start,End),berlin_blockade_AND_tibet(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = berlin_blockade_AND_tibet_at_1948'), (berlin_blockade_AND_tibet_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- berlin_blockade_AND_tibet_aux().

