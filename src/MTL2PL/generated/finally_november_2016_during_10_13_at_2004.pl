:- include('database.pl').
november_2016(Start,End) :- begin('november_2016',_,_,Start), end('november_2016',_,_,End), Start=<End.

finally_november_2016_during_10_13(Start,End) :- november_2016(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

finally_november_2016_during_10_13_at_2004(Res) :- setof((Start,End),finally_november_2016_during_10_13(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = finally_november_2016_during_10_13_at_2004'), (finally_november_2016_during_10_13_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

