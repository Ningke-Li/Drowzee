:- include('database.pl').
ev_1957_1958_influenza_pandemic(Start,End) :- begin('ev_1957_1958_influenza_pandemic',_,_,Start), end('ev_1957_1958_influenza_pandemic',_,_,End), Start=<End.

next_ev_1957_1958_influenza_pandemic(Start,End) :- ev_1957_1958_influenza_pandemic(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1957_1958_influenza_pandemic_at_1912(Res) :- setof((Start,End),next_ev_1957_1958_influenza_pandemic(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = next_ev_1957_1958_influenza_pandemic_at_1912'), (next_ev_1957_1958_influenza_pandemic_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).

