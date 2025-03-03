:- include('database.pl').
veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

generate_facts_veep_AND_the_newsroom([]) :- assert(veep_AND_the_newsroom(-1,-1)).

generate_facts_veep_AND_the_newsroom([(Start,End) | Tail]) :- assert(veep_AND_the_newsroom(Start,End)), generate_facts_veep_AND_the_newsroom(Tail).

veep_AND_the_newsroom_aux() :- findall((Start,End),veep(Start,End),Interval1), findall((Start,End),the_newsroom(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_veep_AND_the_newsroom(Interval).

veep_AND_the_newsroom_at_2013(Res) :- setof((Start,End),veep_AND_the_newsroom(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = veep_AND_the_newsroom_at_2013'), (veep_AND_the_newsroom_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- veep_AND_the_newsroom_aux().

