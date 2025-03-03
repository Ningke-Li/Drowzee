:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

globally_ev_21st_century_during_31_56(Start,End) :- ev_21st_century(Start1,End1), Start is (Start1-31), End is (End1-56), Start=<End.

next_globally_ev_21st_century_during_31_56(Start,End) :- globally_ev_21st_century_during_31_56(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_21st_century_during_31_56_at_2068(Res) :- setof((Start,End),next_globally_ev_21st_century_during_31_56(Start,End),AllINtervals), checkvalidity(2068,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_21st_century_during_31_56_at_2068'), (next_globally_ev_21st_century_during_31_56_at_2068(true) -> write('\nRes   = true');write('\nRes   = false')).

