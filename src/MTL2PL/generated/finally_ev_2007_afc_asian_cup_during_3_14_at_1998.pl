:- include('database.pl').
ev_2007_afc_asian_cup(Start,End) :- begin('ev_2007_afc_asian_cup',_,_,Start), end('ev_2007_afc_asian_cup',_,_,End), Start=<End.

finally_ev_2007_afc_asian_cup_during_3_14(Start,End) :- ev_2007_afc_asian_cup(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_ev_2007_afc_asian_cup_during_3_14_at_1998(Res) :- setof((Start,End),finally_ev_2007_afc_asian_cup_during_3_14(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2007_afc_asian_cup_during_3_14_at_1998'), (finally_ev_2007_afc_asian_cup_during_3_14_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

