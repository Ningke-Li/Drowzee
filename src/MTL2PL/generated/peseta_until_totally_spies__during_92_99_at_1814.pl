:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

peseta_last_till_92_99(Start,End) :- peseta(Start1,End1), (End1-Start1)>=92, Start is (Start1+92), End is (End1+1).

peseta_until_totally_spies__during_92_99_overlap(Start,End) :- peseta_last_till_92_99(Start1,End1), totally_spies_(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peseta_until_totally_spies__during_92_99(Start,End) :- peseta(W1,_), peseta_until_totally_spies__during_92_99_overlap(Start1,End1), Start is max((Start1-99),W1), End is (End1-92), Start=<End.

peseta_until_totally_spies__during_92_99_at_1814(Res) :- setof((Start,End),peseta_until_totally_spies__during_92_99(Start,End),AllINtervals), checkvalidity(1814,AllINtervals,Res).

check_query() :- write('Query = peseta_until_totally_spies__during_92_99_at_1814'), (peseta_until_totally_spies__during_92_99_at_1814(true) -> write('\nRes   = true');write('\nRes   = false')).

