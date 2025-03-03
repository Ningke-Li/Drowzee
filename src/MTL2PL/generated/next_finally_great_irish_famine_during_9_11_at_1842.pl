:- include('database.pl').
great_irish_famine(Start,End) :- begin('great_irish_famine',_,_,Start), end('great_irish_famine',_,_,End), Start=<End.

finally_great_irish_famine_during_9_11(Start,End) :- great_irish_famine(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

next_finally_great_irish_famine_during_9_11(Start,End) :- finally_great_irish_famine_during_9_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_great_irish_famine_during_9_11_at_1842(Res) :- setof((Start,End),next_finally_great_irish_famine_during_9_11(Start,End),AllINtervals), checkvalidity(1842,AllINtervals,Res).

check_query() :- write('Query = next_finally_great_irish_famine_during_9_11_at_1842'), (next_finally_great_irish_famine_during_9_11_at_1842(true) -> write('\nRes   = true');write('\nRes   = false')).

