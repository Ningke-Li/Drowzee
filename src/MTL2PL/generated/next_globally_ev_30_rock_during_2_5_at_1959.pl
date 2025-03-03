:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

globally_ev_30_rock_during_2_5(Start,End) :- ev_30_rock(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

next_globally_ev_30_rock_during_2_5(Start,End) :- globally_ev_30_rock_during_2_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_30_rock_during_2_5_at_1959(Res) :- setof((Start,End),next_globally_ev_30_rock_during_2_5(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_30_rock_during_2_5_at_1959'), (next_globally_ev_30_rock_during_2_5_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

