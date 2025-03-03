:- include('database.pl').
greek_genocide(Start,End) :- begin('greek_genocide',_,_,Start), end('greek_genocide',_,_,End), Start=<End.

finally_greek_genocide_during_4_19(Start,End) :- greek_genocide(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_greek_genocide_during_4_19_at_1846(Res) :- setof((Start,End),finally_greek_genocide_during_4_19(Start,End),AllINtervals), checkvalidity(1846,AllINtervals,Res).

check_query() :- write('Query = finally_greek_genocide_during_4_19_at_1846'), (finally_greek_genocide_during_4_19_at_1846(true) -> write('\nRes   = true');write('\nRes   = false')).

