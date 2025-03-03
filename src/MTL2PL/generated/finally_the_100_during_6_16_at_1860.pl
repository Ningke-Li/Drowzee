:- include('database.pl').
the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

finally_the_100_during_6_16(Start,End) :- the_100(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

finally_the_100_during_6_16_at_1860(Res) :- setof((Start,End),finally_the_100_during_6_16(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = finally_the_100_during_6_16_at_1860'), (finally_the_100_during_6_16_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

