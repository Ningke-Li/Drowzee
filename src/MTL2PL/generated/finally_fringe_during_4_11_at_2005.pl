:- include('database.pl').
fringe(Start,End) :- begin('fringe',_,_,Start), end('fringe',_,_,End), Start=<End.

finally_fringe_during_4_11(Start,End) :- fringe(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

finally_fringe_during_4_11_at_2005(Res) :- setof((Start,End),finally_fringe_during_4_11(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = finally_fringe_during_4_11_at_2005'), (finally_fringe_during_4_11_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

