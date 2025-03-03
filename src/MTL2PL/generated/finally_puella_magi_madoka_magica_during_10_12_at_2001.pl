:- include('database.pl').
puella_magi_madoka_magica(Start,End) :- begin('puella_magi_madoka_magica',_,_,Start), end('puella_magi_madoka_magica',_,_,End), Start=<End.

finally_puella_magi_madoka_magica_during_10_12(Start,End) :- puella_magi_madoka_magica(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_puella_magi_madoka_magica_during_10_12_at_2001(Res) :- setof((Start,End),finally_puella_magi_madoka_magica_during_10_12(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_puella_magi_madoka_magica_during_10_12_at_2001'), (finally_puella_magi_madoka_magica_during_10_12_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

