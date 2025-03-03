:- include('database.pl').
seneca_falls_convention(Start,End) :- begin('seneca_falls_convention',_,_,Start), end('seneca_falls_convention',_,_,End), Start=<End.

finally_seneca_falls_convention_during_1_15(Start,End) :- seneca_falls_convention(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

finally_seneca_falls_convention_during_1_15_at_1842(Res) :- setof((Start,End),finally_seneca_falls_convention_during_1_15(Start,End),AllINtervals), checkvalidity(1842,AllINtervals,Res).

check_query() :- write('Query = finally_seneca_falls_convention_during_1_15_at_1842'), (finally_seneca_falls_convention_during_1_15_at_1842(true) -> write('\nRes   = true');write('\nRes   = false')).

