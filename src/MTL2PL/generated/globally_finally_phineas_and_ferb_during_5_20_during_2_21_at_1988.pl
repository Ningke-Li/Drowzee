:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

finally_phineas_and_ferb_during_5_20(Start,End) :- phineas_and_ferb(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

globally_finally_phineas_and_ferb_during_5_20_during_2_21(Start,End) :- finally_phineas_and_ferb_during_5_20(Start1,End1), Start is (Start1-2), End is (End1-21), Start=<End.

globally_finally_phineas_and_ferb_during_5_20_during_2_21_at_1988(Res) :- setof((Start,End),globally_finally_phineas_and_ferb_during_5_20_during_2_21(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = globally_finally_phineas_and_ferb_during_5_20_during_2_21_at_1988'), (globally_finally_phineas_and_ferb_during_5_20_during_2_21_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).

