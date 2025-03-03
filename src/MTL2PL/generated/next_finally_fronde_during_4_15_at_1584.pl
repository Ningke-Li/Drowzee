:- include('database.pl').
fronde(Start,End) :- begin('fronde',_,_,Start), end('fronde',_,_,End), Start=<End.

finally_fronde_during_4_15(Start,End) :- fronde(Start1,End1), (Start1-15)=<(End1-4), Start is (Start1-15), End is (End1-4), Start=<End.

next_finally_fronde_during_4_15(Start,End) :- finally_fronde_during_4_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_fronde_during_4_15_at_1584(Res) :- setof((Start,End),next_finally_fronde_during_4_15(Start,End),AllINtervals), checkvalidity(1584,AllINtervals,Res).

check_query() :- write('Query = next_finally_fronde_during_4_15_at_1584'), (next_finally_fronde_during_4_15_at_1584(true) -> write('\nRes   = true');write('\nRes   = false')).

