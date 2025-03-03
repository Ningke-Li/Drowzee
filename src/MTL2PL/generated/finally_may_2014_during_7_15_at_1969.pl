:- include('database.pl').
may_2014(Start,End) :- begin('may_2014',_,_,Start), end('may_2014',_,_,End), Start=<End.

finally_may_2014_during_7_15(Start,End) :- may_2014(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_may_2014_during_7_15_at_1969(Res) :- setof((Start,End),finally_may_2014_during_7_15(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = finally_may_2014_during_7_15_at_1969'), (finally_may_2014_during_7_15_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

