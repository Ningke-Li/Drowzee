:- include('database.pl').
austrian_schilling(Start,End) :- begin('austrian_schilling',_,_,Start), end('austrian_schilling',_,_,End), Start=<End.

finally_austrian_schilling_during_3_17(Start,End) :- austrian_schilling(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

next_finally_austrian_schilling_during_3_17(Start,End) :- finally_austrian_schilling_during_3_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_austrian_schilling_during_3_17_at_1956(Res) :- setof((Start,End),next_finally_austrian_schilling_during_3_17(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = next_finally_austrian_schilling_during_3_17_at_1956'), (next_finally_austrian_schilling_during_3_17_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).

