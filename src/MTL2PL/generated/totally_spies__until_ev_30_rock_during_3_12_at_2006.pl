:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

totally_spies__last_till_3_12(Start,End) :- totally_spies_(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

totally_spies__until_ev_30_rock_during_3_12_overlap(Start,End) :- totally_spies__last_till_3_12(Start1,End1), ev_30_rock(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

totally_spies__until_ev_30_rock_during_3_12(Start,End) :- totally_spies_(W1,_), totally_spies__until_ev_30_rock_during_3_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-3), Start=<End.

totally_spies__until_ev_30_rock_during_3_12_at_2006(Res) :- setof((Start,End),totally_spies__until_ev_30_rock_during_3_12(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = totally_spies__until_ev_30_rock_during_3_12_at_2006'), (totally_spies__until_ev_30_rock_during_3_12_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

