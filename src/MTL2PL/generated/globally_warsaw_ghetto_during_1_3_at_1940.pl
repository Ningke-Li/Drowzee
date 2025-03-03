:- include('database.pl').
warsaw_ghetto(Start,End) :- begin('warsaw_ghetto',_,_,Start), end('warsaw_ghetto',_,_,End), Start=<End.

globally_warsaw_ghetto_during_1_3(Start,End) :- warsaw_ghetto(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_warsaw_ghetto_during_1_3_at_1940(Res) :- setof((Start,End),globally_warsaw_ghetto_during_1_3(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = globally_warsaw_ghetto_during_1_3_at_1940'), (globally_warsaw_ghetto_during_1_3_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

