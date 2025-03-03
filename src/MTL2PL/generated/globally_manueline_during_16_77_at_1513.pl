:- include('database.pl').
manueline(Start,End) :- begin('manueline',_,_,Start), end('manueline',_,_,End), Start=<End.

globally_manueline_during_16_77(Start,End) :- manueline(Start1,End1), Start is (Start1-16), End is (End1-77), Start=<End.

globally_manueline_during_16_77_at_1513(Res) :- setof((Start,End),globally_manueline_during_16_77(Start,End),AllINtervals), checkvalidity(1513,AllINtervals,Res).

check_query() :- write('Query = globally_manueline_during_16_77_at_1513'), (globally_manueline_during_16_77_at_1513(true) -> write('\nRes   = true');write('\nRes   = false')).

