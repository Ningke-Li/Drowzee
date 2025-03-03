:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

porajmos(Start,End) :- begin('porajmos',_,_,Start), end('porajmos',_,_,End), Start=<End.

portuguese_escudo_last_till_17_20(Start,End) :- portuguese_escudo(Start1,End1), (End1-Start1)>=17, Start is (Start1+17), End is (End1+1).

portuguese_escudo_until_porajmos_during_17_20_overlap(Start,End) :- portuguese_escudo_last_till_17_20(Start1,End1), porajmos(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

portuguese_escudo_until_porajmos_during_17_20(Start,End) :- portuguese_escudo(W1,_), portuguese_escudo_until_porajmos_during_17_20_overlap(Start1,End1), Start is max((Start1-20),W1), End is (End1-17), Start=<End.

portuguese_escudo_until_porajmos_during_17_20_at_1894(Res) :- setof((Start,End),portuguese_escudo_until_porajmos_during_17_20(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = portuguese_escudo_until_porajmos_during_17_20_at_1894'), (portuguese_escudo_until_porajmos_during_17_20_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).

