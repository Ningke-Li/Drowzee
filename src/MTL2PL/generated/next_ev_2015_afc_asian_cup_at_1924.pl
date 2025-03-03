:- include('database.pl').
ev_2015_afc_asian_cup(Start,End) :- begin('ev_2015_afc_asian_cup',_,_,Start), end('ev_2015_afc_asian_cup',_,_,End), Start=<End.

next_ev_2015_afc_asian_cup(Start,End) :- ev_2015_afc_asian_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2015_afc_asian_cup_at_1924(Res) :- setof((Start,End),next_ev_2015_afc_asian_cup(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = next_ev_2015_afc_asian_cup_at_1924'), (next_ev_2015_afc_asian_cup_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

