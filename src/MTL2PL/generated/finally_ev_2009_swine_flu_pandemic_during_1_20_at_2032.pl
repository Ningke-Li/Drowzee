:- include('database.pl').
ev_2009_swine_flu_pandemic(Start,End) :- begin('ev_2009_swine_flu_pandemic',_,_,Start), end('ev_2009_swine_flu_pandemic',_,_,End), Start=<End.

finally_ev_2009_swine_flu_pandemic_during_1_20(Start,End) :- ev_2009_swine_flu_pandemic(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_ev_2009_swine_flu_pandemic_during_1_20_at_2032(Res) :- setof((Start,End),finally_ev_2009_swine_flu_pandemic_during_1_20(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_swine_flu_pandemic_during_1_20_at_2032'), (finally_ev_2009_swine_flu_pandemic_during_1_20_at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).

