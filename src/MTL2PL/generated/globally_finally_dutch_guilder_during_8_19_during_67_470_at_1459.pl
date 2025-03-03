:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

finally_dutch_guilder_during_8_19(Start,End) :- dutch_guilder(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

globally_finally_dutch_guilder_during_8_19_during_67_470(Start,End) :- finally_dutch_guilder_during_8_19(Start1,End1), Start is (Start1-67), End is (End1-470), Start=<End.

globally_finally_dutch_guilder_during_8_19_during_67_470_at_1459(Res) :- setof((Start,End),globally_finally_dutch_guilder_during_8_19_during_67_470(Start,End),AllINtervals), checkvalidity(1459,AllINtervals,Res).

check_query() :- write('Query = globally_finally_dutch_guilder_during_8_19_during_67_470_at_1459'), (globally_finally_dutch_guilder_during_8_19_during_67_470_at_1459(true) -> write('\nRes   = true');write('\nRes   = false')).

