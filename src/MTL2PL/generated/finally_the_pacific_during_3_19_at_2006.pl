:- include('database.pl').
the_pacific(Start,End) :- begin('the_pacific',_,_,Start), end('the_pacific',_,_,End), Start=<End.

finally_the_pacific_during_3_19(Start,End) :- the_pacific(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

finally_the_pacific_during_3_19_at_2006(Res) :- setof((Start,End),finally_the_pacific_during_3_19(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = finally_the_pacific_during_3_19_at_2006'), (finally_the_pacific_during_3_19_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

