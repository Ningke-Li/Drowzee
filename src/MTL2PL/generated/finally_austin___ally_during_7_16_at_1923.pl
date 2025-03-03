:- include('database.pl').
austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

finally_austin___ally_during_7_16(Start,End) :- austin___ally(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

finally_austin___ally_during_7_16_at_1923(Res) :- setof((Start,End),finally_austin___ally_during_7_16(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = finally_austin___ally_during_7_16_at_1923'), (finally_austin___ally_during_7_16_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).

