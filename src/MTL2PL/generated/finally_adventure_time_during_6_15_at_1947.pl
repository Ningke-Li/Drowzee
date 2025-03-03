:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

finally_adventure_time_during_6_15(Start,End) :- adventure_time(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

finally_adventure_time_during_6_15_at_1947(Res) :- setof((Start,End),finally_adventure_time_during_6_15(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = finally_adventure_time_during_6_15_at_1947'), (finally_adventure_time_during_6_15_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

