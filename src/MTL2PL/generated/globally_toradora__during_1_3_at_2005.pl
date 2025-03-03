:- include('database.pl').
toradora_(Start,End) :- begin('toradora_',_,_,Start), end('toradora_',_,_,End), Start=<End.

globally_toradora__during_1_3(Start,End) :- toradora_(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_toradora__during_1_3_at_2005(Res) :- setof((Start,End),globally_toradora__during_1_3(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = globally_toradora__during_1_3_at_2005'), (globally_toradora__during_1_3_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

