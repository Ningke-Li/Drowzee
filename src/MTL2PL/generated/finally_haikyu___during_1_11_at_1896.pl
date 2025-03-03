:- include('database.pl').
haikyu__(Start,End) :- begin('haikyu__',_,_,Start), end('haikyu__',_,_,End), Start=<End.

finally_haikyu___during_1_11(Start,End) :- haikyu__(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

finally_haikyu___during_1_11_at_1896(Res) :- setof((Start,End),finally_haikyu___during_1_11(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = finally_haikyu___during_1_11_at_1896'), (finally_haikyu___during_1_11_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).

