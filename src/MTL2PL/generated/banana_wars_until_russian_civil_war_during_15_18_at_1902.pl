:- include('database.pl').
banana_wars(Start,End) :- begin('banana_wars',_,_,Start), end('banana_wars',_,_,End), Start=<End.

russian_civil_war(Start,End) :- begin('russian_civil_war',_,_,Start), end('russian_civil_war',_,_,End), Start=<End.

banana_wars_last_till_15_18(Start,End) :- banana_wars(Start1,End1), (End1-Start1)>=15, Start is (Start1+15), End is (End1+1).

banana_wars_until_russian_civil_war_during_15_18_overlap(Start,End) :- banana_wars_last_till_15_18(Start1,End1), russian_civil_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

banana_wars_until_russian_civil_war_during_15_18(Start,End) :- banana_wars(W1,_), banana_wars_until_russian_civil_war_during_15_18_overlap(Start1,End1), Start is max((Start1-18),W1), End is (End1-15), Start=<End.

banana_wars_until_russian_civil_war_during_15_18_at_1902(Res) :- setof((Start,End),banana_wars_until_russian_civil_war_during_15_18(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = banana_wars_until_russian_civil_war_during_15_18_at_1902'), (banana_wars_until_russian_civil_war_during_15_18_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

