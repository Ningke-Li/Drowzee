:- include('database.pl').
october_revolution(Start,End) :- begin('october_revolution',_,_,Start), end('october_revolution',_,_,End), Start=<End.

finally_october_revolution_during_2_15(Start,End) :- october_revolution(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_october_revolution_during_2_15_at_1904(Res) :- setof((Start,End),finally_october_revolution_during_2_15(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = finally_october_revolution_during_2_15_at_1904'), (finally_october_revolution_during_2_15_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

