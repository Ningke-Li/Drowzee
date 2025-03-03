:- include('database.pl').
sons_of_anarchy(Start,End) :- begin('sons_of_anarchy',_,_,Start), end('sons_of_anarchy',_,_,End), Start=<End.

kill_la_kill(Start,End) :- begin('kill_la_kill',_,_,Start), end('kill_la_kill',_,_,End), Start=<End.

sons_of_anarchy_last_till_3_11(Start,End) :- sons_of_anarchy(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

sons_of_anarchy_until_kill_la_kill_during_3_11_overlap(Start,End) :- sons_of_anarchy_last_till_3_11(Start1,End1), kill_la_kill(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sons_of_anarchy_until_kill_la_kill_during_3_11(Start,End) :- sons_of_anarchy(W1,_), sons_of_anarchy_until_kill_la_kill_during_3_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-3), Start=<End.

sons_of_anarchy_until_kill_la_kill_during_3_11_at_1947(Res) :- setof((Start,End),sons_of_anarchy_until_kill_la_kill_during_3_11(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = sons_of_anarchy_until_kill_la_kill_during_3_11_at_1947'), (sons_of_anarchy_until_kill_la_kill_during_3_11_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

