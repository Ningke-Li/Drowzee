:- include('database.pl').
habsburg_spain(Start,End) :- begin('habsburg_spain',_,_,Start), end('habsburg_spain',_,_,End), Start=<End.

council_of_trent(Start,End) :- begin('council_of_trent',_,_,Start), end('council_of_trent',_,_,End), Start=<End.

habsburg_spain_last_till_7_12(Start,End) :- habsburg_spain(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

habsburg_spain_until_council_of_trent_during_7_12_overlap(Start,End) :- habsburg_spain_last_till_7_12(Start1,End1), council_of_trent(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

habsburg_spain_until_council_of_trent_during_7_12(Start,End) :- habsburg_spain(W1,_), habsburg_spain_until_council_of_trent_during_7_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-7), Start=<End.

habsburg_spain_until_council_of_trent_during_7_12_at_1389(Res) :- setof((Start,End),habsburg_spain_until_council_of_trent_during_7_12(Start,End),AllINtervals), checkvalidity(1389,AllINtervals,Res).

check_query() :- write('Query = habsburg_spain_until_council_of_trent_during_7_12_at_1389'), (habsburg_spain_until_council_of_trent_during_7_12_at_1389(true) -> write('\nRes   = true');write('\nRes   = false')).

