:- include('database.pl').
lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

lithuanian_litas_last_till_7_14(Start,End) :- lithuanian_litas(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

lithuanian_litas_until_arrested_development_during_7_14_overlap(Start,End) :- lithuanian_litas_last_till_7_14(Start1,End1), arrested_development(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lithuanian_litas_until_arrested_development_during_7_14(Start,End) :- lithuanian_litas(W1,_), lithuanian_litas_until_arrested_development_during_7_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-7), Start=<End.

lithuanian_litas_until_arrested_development_during_7_14_at_1847(Res) :- setof((Start,End),lithuanian_litas_until_arrested_development_during_7_14(Start,End),AllINtervals), checkvalidity(1847,AllINtervals,Res).

check_query() :- write('Query = lithuanian_litas_until_arrested_development_during_7_14_at_1847'), (lithuanian_litas_until_arrested_development_during_7_14_at_1847(true) -> write('\nRes   = true');write('\nRes   = false')).

