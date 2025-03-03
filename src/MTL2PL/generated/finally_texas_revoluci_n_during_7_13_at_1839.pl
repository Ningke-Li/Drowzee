:- include('database.pl').
texas_revoluci_n(Start,End) :- begin('texas_revoluci_n',_,_,Start), end('texas_revoluci_n',_,_,End), Start=<End.

finally_texas_revoluci_n_during_7_13(Start,End) :- texas_revoluci_n(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

finally_texas_revoluci_n_during_7_13_at_1839(Res) :- setof((Start,End),finally_texas_revoluci_n_during_7_13(Start,End),AllINtervals), checkvalidity(1839,AllINtervals,Res).

check_query() :- write('Query = finally_texas_revoluci_n_during_7_13_at_1839'), (finally_texas_revoluci_n_during_7_13_at_1839(true) -> write('\nRes   = true');write('\nRes   = false')).

