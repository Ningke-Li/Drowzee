:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

next_peseta(Start,End) :- peseta(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_peseta_at_2006(Res) :- setof((Start,End),next_peseta(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = next_peseta_at_2006'), (next_peseta_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

