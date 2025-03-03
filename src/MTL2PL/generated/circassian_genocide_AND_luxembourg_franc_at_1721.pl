:- include('database.pl').
circassian_genocide(Start,End) :- begin('circassian_genocide',_,_,Start), end('circassian_genocide',_,_,End), Start=<End.

luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

generate_facts_circassian_genocide_AND_luxembourg_franc([]) :- assert(circassian_genocide_AND_luxembourg_franc(-1,-1)).

generate_facts_circassian_genocide_AND_luxembourg_franc([(Start,End) | Tail]) :- assert(circassian_genocide_AND_luxembourg_franc(Start,End)), generate_facts_circassian_genocide_AND_luxembourg_franc(Tail).

circassian_genocide_AND_luxembourg_franc_aux() :- findall((Start,End),circassian_genocide(Start,End),Interval1), findall((Start,End),luxembourg_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_circassian_genocide_AND_luxembourg_franc(Interval).

circassian_genocide_AND_luxembourg_franc_at_1721(Res) :- setof((Start,End),circassian_genocide_AND_luxembourg_franc(Start,End),AllINtervals), checkvalidity(1721,AllINtervals,Res).

check_query() :- write('Query = circassian_genocide_AND_luxembourg_franc_at_1721'), (circassian_genocide_AND_luxembourg_franc_at_1721(true) -> write('\nRes   = true');write('\nRes   = false')).
?- circassian_genocide_AND_luxembourg_franc_aux().

