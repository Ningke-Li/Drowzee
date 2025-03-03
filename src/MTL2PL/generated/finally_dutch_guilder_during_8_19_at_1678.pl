:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

finally_dutch_guilder_during_8_19(Start,End) :- dutch_guilder(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

finally_dutch_guilder_during_8_19_at_1678(Res) :- setof((Start,End),finally_dutch_guilder_during_8_19(Start,End),AllINtervals), checkvalidity(1678,AllINtervals,Res).

check_query() :- write('Query = finally_dutch_guilder_during_8_19_at_1678'), (finally_dutch_guilder_during_8_19_at_1678(true) -> write('\nRes   = true');write('\nRes   = false')).

