:- include('database.pl').
beyblade(Start,End) :- begin('beyblade',_,_,Start), end('beyblade',_,_,End), Start=<End.

finally_beyblade_during_5_13(Start,End) :- beyblade(Start1,End1), (Start1-13)=<(End1-5), Start is (Start1-13), End is (End1-5), Start=<End.

finally_beyblade_during_5_13_at_1851(Res) :- setof((Start,End),finally_beyblade_during_5_13(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = finally_beyblade_during_5_13_at_1851'), (finally_beyblade_during_5_13_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).

