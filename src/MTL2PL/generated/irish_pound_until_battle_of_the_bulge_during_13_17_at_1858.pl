:- include('database.pl').
irish_pound(Start,End) :- begin('irish_pound',_,_,Start), end('irish_pound',_,_,End), Start=<End.

battle_of_the_bulge(Start,End) :- begin('battle_of_the_bulge',_,_,Start), end('battle_of_the_bulge',_,_,End), Start=<End.

irish_pound_last_till_13_17(Start,End) :- irish_pound(Start1,End1), (End1-Start1)>=13, Start is (Start1+13), End is (End1+1).

irish_pound_until_battle_of_the_bulge_during_13_17_overlap(Start,End) :- irish_pound_last_till_13_17(Start1,End1), battle_of_the_bulge(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

irish_pound_until_battle_of_the_bulge_during_13_17(Start,End) :- irish_pound(W1,_), irish_pound_until_battle_of_the_bulge_during_13_17_overlap(Start1,End1), Start is max((Start1-17),W1), End is (End1-13), Start=<End.

irish_pound_until_battle_of_the_bulge_during_13_17_at_1858(Res) :- setof((Start,End),irish_pound_until_battle_of_the_bulge_during_13_17(Start,End),AllINtervals), checkvalidity(1858,AllINtervals,Res).

check_query() :- write('Query = irish_pound_until_battle_of_the_bulge_during_13_17_at_1858'), (irish_pound_until_battle_of_the_bulge_during_13_17_at_1858(true) -> write('\nRes   = true');write('\nRes   = false')).

