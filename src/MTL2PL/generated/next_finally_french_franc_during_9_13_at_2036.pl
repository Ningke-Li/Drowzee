:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

finally_french_franc_during_9_13(Start,End) :- french_franc(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

next_finally_french_franc_during_9_13(Start,End) :- finally_french_franc_during_9_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_french_franc_during_9_13_at_2036(Res) :- setof((Start,End),next_finally_french_franc_during_9_13(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = next_finally_french_franc_during_9_13_at_2036'), (next_finally_french_franc_during_9_13_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).

