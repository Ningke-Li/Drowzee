:- include('database.pl').
austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

globally_austin___ally_during_1_4(Start,End) :- austin___ally(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_austin___ally_during_1_4_at_1931(Res) :- setof((Start,End),globally_austin___ally_during_1_4(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = globally_austin___ally_during_1_4_at_1931'), (globally_austin___ally_during_1_4_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

