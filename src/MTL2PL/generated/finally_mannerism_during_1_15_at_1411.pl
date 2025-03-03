:- include('database.pl').
mannerism(Start,End) :- begin('mannerism',_,_,Start), end('mannerism',_,_,End), Start=<End.

finally_mannerism_during_1_15(Start,End) :- mannerism(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

finally_mannerism_during_1_15_at_1411(Res) :- setof((Start,End),finally_mannerism_during_1_15(Start,End),AllINtervals), checkvalidity(1411,AllINtervals,Res).

check_query() :- write('Query = finally_mannerism_during_1_15_at_1411'), (finally_mannerism_during_1_15_at_1411(true) -> write('\nRes   = true');write('\nRes   = false')).

