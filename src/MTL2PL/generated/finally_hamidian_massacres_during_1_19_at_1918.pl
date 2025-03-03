:- include('database.pl').
hamidian_massacres(Start,End) :- begin('hamidian_massacres',_,_,Start), end('hamidian_massacres',_,_,End), Start=<End.

finally_hamidian_massacres_during_1_19(Start,End) :- hamidian_massacres(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

finally_hamidian_massacres_during_1_19_at_1918(Res) :- setof((Start,End),finally_hamidian_massacres_during_1_19(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = finally_hamidian_massacres_during_1_19_at_1918'), (finally_hamidian_massacres_during_1_19_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

