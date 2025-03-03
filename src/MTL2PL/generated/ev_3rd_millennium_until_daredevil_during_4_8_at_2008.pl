:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

daredevil(Start,End) :- begin('daredevil',_,_,Start), end('daredevil',_,_,End), Start=<End.

ev_3rd_millennium_last_till_4_8(Start,End) :- ev_3rd_millennium(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

ev_3rd_millennium_until_daredevil_during_4_8_overlap(Start,End) :- ev_3rd_millennium_last_till_4_8(Start1,End1), daredevil(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_3rd_millennium_until_daredevil_during_4_8(Start,End) :- ev_3rd_millennium(W1,_), ev_3rd_millennium_until_daredevil_during_4_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-4), Start=<End.

ev_3rd_millennium_until_daredevil_during_4_8_at_2008(Res) :- setof((Start,End),ev_3rd_millennium_until_daredevil_during_4_8(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_until_daredevil_during_4_8_at_2008'), (ev_3rd_millennium_until_daredevil_during_4_8_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

