:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

ev_2010s_last_till_1_2(Start,End) :- ev_2010s(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ev_2010s_until_second_libyan_civil_war_during_1_2_overlap(Start,End) :- ev_2010s_last_till_1_2(Start1,End1), second_libyan_civil_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_2010s_until_second_libyan_civil_war_during_1_2(Start,End) :- ev_2010s(W1,_), ev_2010s_until_second_libyan_civil_war_during_1_2_overlap(Start1,End1), Start is max((Start1-2),W1), End is (End1-1), Start=<End.

ev_2010s_until_second_libyan_civil_war_during_1_2_at_2012(Res) :- setof((Start,End),ev_2010s_until_second_libyan_civil_war_during_1_2(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = ev_2010s_until_second_libyan_civil_war_during_1_2_at_2012'), (ev_2010s_until_second_libyan_civil_war_during_1_2_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

