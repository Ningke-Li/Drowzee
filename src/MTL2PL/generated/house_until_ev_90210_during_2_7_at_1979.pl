:- include('database.pl').
house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

ev_90210(Start,End) :- begin('ev_90210',_,_,Start), end('ev_90210',_,_,End), Start=<End.

house_last_till_2_7(Start,End) :- house(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

house_until_ev_90210_during_2_7_overlap(Start,End) :- house_last_till_2_7(Start1,End1), ev_90210(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

house_until_ev_90210_during_2_7(Start,End) :- house(W1,_), house_until_ev_90210_during_2_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-2), Start=<End.

house_until_ev_90210_during_2_7_at_1979(Res) :- setof((Start,End),house_until_ev_90210_during_2_7(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = house_until_ev_90210_during_2_7_at_1979'), (house_until_ev_90210_during_2_7_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

