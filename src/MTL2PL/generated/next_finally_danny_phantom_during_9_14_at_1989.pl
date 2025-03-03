:- include('database.pl').
danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

finally_danny_phantom_during_9_14(Start,End) :- danny_phantom(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

next_finally_danny_phantom_during_9_14(Start,End) :- finally_danny_phantom_during_9_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_danny_phantom_during_9_14_at_1989(Res) :- setof((Start,End),next_finally_danny_phantom_during_9_14(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = next_finally_danny_phantom_during_9_14_at_1989'), (next_finally_danny_phantom_during_9_14_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).

