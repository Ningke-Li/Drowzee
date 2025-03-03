:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

finally_phineas_and_ferb_during_10_17(Start,End) :- phineas_and_ferb(Start1,End1), (Start1-17)=<(End1-10), Start is (Start1-17), End is (End1-10), Start=<End.

globally_finally_phineas_and_ferb_during_10_17_during_1_14(Start,End) :- finally_phineas_and_ferb_during_10_17(Start1,End1), Start is (Start1-1), End is (End1-14), Start=<End.

globally_finally_phineas_and_ferb_during_10_17_during_1_14_at_1955(Res) :- setof((Start,End),globally_finally_phineas_and_ferb_during_10_17_during_1_14(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = globally_finally_phineas_and_ferb_during_10_17_during_1_14_at_1955'), (globally_finally_phineas_and_ferb_during_10_17_during_1_14_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).

