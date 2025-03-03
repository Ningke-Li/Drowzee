:- include('database.pl').
ev_2009_swine_flu_pandemic(Start,End) :- begin('ev_2009_swine_flu_pandemic',_,_,Start), end('ev_2009_swine_flu_pandemic',_,_,End), Start=<End.

finally_ev_2009_swine_flu_pandemic_during_9_11(Start,End) :- ev_2009_swine_flu_pandemic(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_ev_2009_swine_flu_pandemic_during_9_11_at_1999(Res) :- setof((Start,End),finally_ev_2009_swine_flu_pandemic_during_9_11(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_swine_flu_pandemic_during_9_11_at_1999'), (finally_ev_2009_swine_flu_pandemic_during_9_11_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

