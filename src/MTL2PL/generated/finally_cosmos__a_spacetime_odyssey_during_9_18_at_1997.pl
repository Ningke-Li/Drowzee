:- include('database.pl').
cosmos__a_spacetime_odyssey(Start,End) :- begin('cosmos__a_spacetime_odyssey',_,_,Start), end('cosmos__a_spacetime_odyssey',_,_,End), Start=<End.

finally_cosmos__a_spacetime_odyssey_during_9_18(Start,End) :- cosmos__a_spacetime_odyssey(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_cosmos__a_spacetime_odyssey_during_9_18_at_1997(Res) :- setof((Start,End),finally_cosmos__a_spacetime_odyssey_during_9_18(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = finally_cosmos__a_spacetime_odyssey_during_9_18_at_1997'), (finally_cosmos__a_spacetime_odyssey_during_9_18_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

