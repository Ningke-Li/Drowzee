:- include('database.pl').
ev_26_11_mumbai_attacks(Start,End) :- begin('ev_26_11_mumbai_attacks',_,_,Start), end('ev_26_11_mumbai_attacks',_,_,End), Start=<End.

next_ev_26_11_mumbai_attacks(Start,End) :- ev_26_11_mumbai_attacks(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_26_11_mumbai_attacks_at_2007(Res) :- setof((Start,End),next_ev_26_11_mumbai_attacks(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = next_ev_26_11_mumbai_attacks_at_2007'), (next_ev_26_11_mumbai_attacks_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

