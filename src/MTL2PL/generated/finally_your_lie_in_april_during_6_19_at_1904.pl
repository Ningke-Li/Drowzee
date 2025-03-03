:- include('database.pl').
your_lie_in_april(Start,End) :- begin('your_lie_in_april',_,_,Start), end('your_lie_in_april',_,_,End), Start=<End.

finally_your_lie_in_april_during_6_19(Start,End) :- your_lie_in_april(Start1,End1), (Start1-19)=<(End1-6), Start is (Start1-19), End is (End1-6), Start=<End.

finally_your_lie_in_april_during_6_19_at_1904(Res) :- setof((Start,End),finally_your_lie_in_april_during_6_19(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = finally_your_lie_in_april_during_6_19_at_1904'), (finally_your_lie_in_april_during_6_19_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

