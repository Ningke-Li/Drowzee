:- include('database.pl').
tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

battle_of_stalingrad(Start,End) :- begin('battle_of_stalingrad',_,_,Start), end('battle_of_stalingrad',_,_,End), Start=<End.

tibet_last_till_11_17(Start,End) :- tibet(Start1,End1), (End1-Start1)>=11, Start is (Start1+11), End is (End1+1).

tibet_until_battle_of_stalingrad_during_11_17_overlap(Start,End) :- tibet_last_till_11_17(Start1,End1), battle_of_stalingrad(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

tibet_until_battle_of_stalingrad_during_11_17(Start,End) :- tibet(W1,_), tibet_until_battle_of_stalingrad_during_11_17_overlap(Start1,End1), Start is max((Start1-17),W1), End is (End1-11), Start=<End.

tibet_until_battle_of_stalingrad_during_11_17_at_1868(Res) :- setof((Start,End),tibet_until_battle_of_stalingrad_during_11_17(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = tibet_until_battle_of_stalingrad_during_11_17_at_1868'), (tibet_until_battle_of_stalingrad_during_11_17_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).

