:- include('database.pl').
czechoslovak_koruna(Start,End) :- begin('czechoslovak_koruna',_,_,Start), end('czechoslovak_koruna',_,_,End), Start=<End.

irish_civil_war(Start,End) :- begin('irish_civil_war',_,_,Start), end('irish_civil_war',_,_,End), Start=<End.

czechoslovak_koruna_last_till_1_9(Start,End) :- czechoslovak_koruna(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

czechoslovak_koruna_until_irish_civil_war_during_1_9_overlap(Start,End) :- czechoslovak_koruna_last_till_1_9(Start1,End1), irish_civil_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

czechoslovak_koruna_until_irish_civil_war_during_1_9(Start,End) :- czechoslovak_koruna(W1,_), czechoslovak_koruna_until_irish_civil_war_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

czechoslovak_koruna_until_irish_civil_war_during_1_9_at_1826(Res) :- setof((Start,End),czechoslovak_koruna_until_irish_civil_war_during_1_9(Start,End),AllINtervals), checkvalidity(1826,AllINtervals,Res).

check_query() :- write('Query = czechoslovak_koruna_until_irish_civil_war_during_1_9_at_1826'), (czechoslovak_koruna_until_irish_civil_war_during_1_9_at_1826(true) -> write('\nRes   = true');write('\nRes   = false')).

