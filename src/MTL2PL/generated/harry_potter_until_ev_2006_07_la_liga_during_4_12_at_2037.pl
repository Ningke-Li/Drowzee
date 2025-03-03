:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

ev_2006_07_la_liga(Start,End) :- begin('ev_2006_07_la_liga',_,_,Start), end('ev_2006_07_la_liga',_,_,End), Start=<End.

harry_potter_last_till_4_12(Start,End) :- harry_potter(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

harry_potter_until_ev_2006_07_la_liga_during_4_12_overlap(Start,End) :- harry_potter_last_till_4_12(Start1,End1), ev_2006_07_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

harry_potter_until_ev_2006_07_la_liga_during_4_12(Start,End) :- harry_potter(W1,_), harry_potter_until_ev_2006_07_la_liga_during_4_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-4), Start=<End.

harry_potter_until_ev_2006_07_la_liga_during_4_12_at_2037(Res) :- setof((Start,End),harry_potter_until_ev_2006_07_la_liga_during_4_12(Start,End),AllINtervals), checkvalidity(2037,AllINtervals,Res).

check_query() :- write('Query = harry_potter_until_ev_2006_07_la_liga_during_4_12_at_2037'), (harry_potter_until_ev_2006_07_la_liga_during_4_12_at_2037(true) -> write('\nRes   = true');write('\nRes   = false')).

