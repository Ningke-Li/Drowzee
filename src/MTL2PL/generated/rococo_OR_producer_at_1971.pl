:- include('database.pl').
rococo(Start,End) :- begin('rococo',_,_,Start), end('rococo',_,_,End), Start=<End.

producer(Start,End) :- begin('producer',_,_,Start), end('producer',_,_,End), Start=<End.

generate_facts_rococo_OR_producer([]) :- assert(rococo_OR_producer(-1,-1)).

generate_facts_rococo_OR_producer([(Start,End) | Tail]) :- assert(rococo_OR_producer(Start,End)), generate_facts_rococo_OR_producer(Tail).

rococo_OR_producer_aux() :- findall((Start,End),rococo(Start,End),Interval1), findall((Start,End),producer(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_rococo_OR_producer(Interval).

rococo_OR_producer_at_1971(Res) :- setof((Start,End),rococo_OR_producer(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = rococo_OR_producer_at_1971'), (rococo_OR_producer_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).
?- rococo_OR_producer_aux().

