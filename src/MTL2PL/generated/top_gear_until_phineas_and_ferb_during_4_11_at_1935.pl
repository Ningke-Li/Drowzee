:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

top_gear_last_till_4_11(Start,End) :- top_gear(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

top_gear_until_phineas_and_ferb_during_4_11_overlap(Start,End) :- top_gear_last_till_4_11(Start1,End1), phineas_and_ferb(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

top_gear_until_phineas_and_ferb_during_4_11(Start,End) :- top_gear(W1,_), top_gear_until_phineas_and_ferb_during_4_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-4), Start=<End.

top_gear_until_phineas_and_ferb_during_4_11_at_1935(Res) :- setof((Start,End),top_gear_until_phineas_and_ferb_during_4_11(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = top_gear_until_phineas_and_ferb_during_4_11_at_1935'), (top_gear_until_phineas_and_ferb_during_4_11_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

