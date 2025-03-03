:- include('database.pl').
lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

lithuanian_litas_last_till_12_15(Start,End) :- lithuanian_litas(Start1,End1), (End1-Start1)>=12, Start is (Start1+12), End is (End1+1).

lithuanian_litas_until_elementary_during_12_15_overlap(Start,End) :- lithuanian_litas_last_till_12_15(Start1,End1), elementary(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lithuanian_litas_until_elementary_during_12_15(Start,End) :- lithuanian_litas(W1,_), lithuanian_litas_until_elementary_during_12_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-12), Start=<End.

lithuanian_litas_until_elementary_during_12_15_at_1874(Res) :- setof((Start,End),lithuanian_litas_until_elementary_during_12_15(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = lithuanian_litas_until_elementary_during_12_15_at_1874'), (lithuanian_litas_until_elementary_during_12_15_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).

