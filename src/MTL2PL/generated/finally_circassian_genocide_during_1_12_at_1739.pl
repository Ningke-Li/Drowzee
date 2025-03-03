:- include('database.pl').
circassian_genocide(Start,End) :- begin('circassian_genocide',_,_,Start), end('circassian_genocide',_,_,End), Start=<End.

finally_circassian_genocide_during_1_12(Start,End) :- circassian_genocide(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

finally_circassian_genocide_during_1_12_at_1739(Res) :- setof((Start,End),finally_circassian_genocide_during_1_12(Start,End),AllINtervals), checkvalidity(1739,AllINtervals,Res).

check_query() :- write('Query = finally_circassian_genocide_during_1_12_at_1739'), (finally_circassian_genocide_during_1_12_at_1739(true) -> write('\nRes   = true');write('\nRes   = false')).

