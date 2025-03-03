:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

ev_2014_15_la_liga(Start,End) :- begin('ev_2014_15_la_liga',_,_,Start), end('ev_2014_15_la_liga',_,_,End), Start=<End.

dora_the_explorer_last_till_7_16(Start,End) :- dora_the_explorer(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

dora_the_explorer_until_ev_2014_15_la_liga_during_7_16_overlap(Start,End) :- dora_the_explorer_last_till_7_16(Start1,End1), ev_2014_15_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dora_the_explorer_until_ev_2014_15_la_liga_during_7_16(Start,End) :- dora_the_explorer(W1,_), dora_the_explorer_until_ev_2014_15_la_liga_during_7_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-7), Start=<End.

dora_the_explorer_until_ev_2014_15_la_liga_during_7_16_at_1874(Res) :- setof((Start,End),dora_the_explorer_until_ev_2014_15_la_liga_during_7_16(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_until_ev_2014_15_la_liga_during_7_16_at_1874'), (dora_the_explorer_until_ev_2014_15_la_liga_during_7_16_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).

