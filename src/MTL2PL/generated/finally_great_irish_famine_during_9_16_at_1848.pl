:- include('database.pl').
great_irish_famine(Start,End) :- begin('great_irish_famine',_,_,Start), end('great_irish_famine',_,_,End), Start=<End.

finally_great_irish_famine_during_9_16(Start,End) :- great_irish_famine(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

finally_great_irish_famine_during_9_16_at_1848(Res) :- setof((Start,End),finally_great_irish_famine_during_9_16(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = finally_great_irish_famine_during_9_16_at_1848'), (finally_great_irish_famine_during_9_16_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).

