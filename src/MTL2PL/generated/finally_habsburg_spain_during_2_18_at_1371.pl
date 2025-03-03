:- include('database.pl').
habsburg_spain(Start,End) :- begin('habsburg_spain',_,_,Start), end('habsburg_spain',_,_,End), Start=<End.

finally_habsburg_spain_during_2_18(Start,End) :- habsburg_spain(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

finally_habsburg_spain_during_2_18_at_1371(Res) :- setof((Start,End),finally_habsburg_spain_during_2_18(Start,End),AllINtervals), checkvalidity(1371,AllINtervals,Res).

check_query() :- write('Query = finally_habsburg_spain_during_2_18_at_1371'), (finally_habsburg_spain_during_2_18_at_1371(true) -> write('\nRes   = true');write('\nRes   = false')).

