:- include('database.pl').
your_lie_in_april(Start,End) :- begin('your_lie_in_april',_,_,Start), end('your_lie_in_april',_,_,End), Start=<End.

finally_your_lie_in_april_during_4_12(Start,End) :- your_lie_in_april(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_your_lie_in_april_during_4_12_at_1976(Res) :- setof((Start,End),finally_your_lie_in_april_during_4_12(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = finally_your_lie_in_april_during_4_12_at_1976'), (finally_your_lie_in_april_during_4_12_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

