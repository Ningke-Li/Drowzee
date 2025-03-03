:- include('database.pl').
torchwood(Start,End) :- begin('torchwood',_,_,Start), end('torchwood',_,_,End), Start=<End.

globally_torchwood_during_3_4(Start,End) :- torchwood(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

globally_torchwood_during_3_4_at_2005(Res) :- setof((Start,End),globally_torchwood_during_3_4(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = globally_torchwood_during_3_4_at_2005'), (globally_torchwood_during_3_4_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

