:- include('database.pl').
ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

polish_soviet_war(Start,End) :- begin('polish_soviet_war',_,_,Start), end('polish_soviet_war',_,_,End), Start=<End.

ev_20th_century_last_till_17_18(Start,End) :- ev_20th_century(Start1,End1), (End1-Start1)>=17, Start is (Start1+17), End is (End1+1).

ev_20th_century_until_polish_soviet_war_during_17_18_overlap(Start,End) :- ev_20th_century_last_till_17_18(Start1,End1), polish_soviet_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_20th_century_until_polish_soviet_war_during_17_18(Start,End) :- ev_20th_century(W1,_), ev_20th_century_until_polish_soviet_war_during_17_18_overlap(Start1,End1), Start is max((Start1-18),W1), End is (End1-17), Start=<End.

ev_20th_century_until_polish_soviet_war_during_17_18_at_1831(Res) :- setof((Start,End),ev_20th_century_until_polish_soviet_war_during_17_18(Start,End),AllINtervals), checkvalidity(1831,AllINtervals,Res).

check_query() :- write('Query = ev_20th_century_until_polish_soviet_war_during_17_18_at_1831'), (ev_20th_century_until_polish_soviet_war_during_17_18_at_1831(true) -> write('\nRes   = true');write('\nRes   = false')).

