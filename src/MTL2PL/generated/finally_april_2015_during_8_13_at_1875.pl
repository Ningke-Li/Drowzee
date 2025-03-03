:- include('database.pl').
april_2015(Start,End) :- begin('april_2015',_,_,Start), end('april_2015',_,_,End), Start=<End.

finally_april_2015_during_8_13(Start,End) :- april_2015(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

finally_april_2015_during_8_13_at_1875(Res) :- setof((Start,End),finally_april_2015_during_8_13(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = finally_april_2015_during_8_13_at_1875'), (finally_april_2015_during_8_13_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

