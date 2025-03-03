:- include('database.pl').
ev_40th_chess_olympiad(Start,End) :- begin('ev_40th_chess_olympiad',_,_,Start), end('ev_40th_chess_olympiad',_,_,End), Start=<End.

finally_ev_40th_chess_olympiad_during_4_12(Start,End) :- ev_40th_chess_olympiad(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_ev_40th_chess_olympiad_during_4_12_at_2007(Res) :- setof((Start,End),finally_ev_40th_chess_olympiad_during_4_12(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = finally_ev_40th_chess_olympiad_during_4_12_at_2007'), (finally_ev_40th_chess_olympiad_during_4_12_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

