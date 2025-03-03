:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

finally_latvian_lats_during_8_14(Start,End) :- latvian_lats(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_latvian_lats_during_8_14_at_1994(Res) :- setof((Start,End),finally_latvian_lats_during_8_14(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = finally_latvian_lats_during_8_14_at_1994'), (finally_latvian_lats_during_8_14_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

