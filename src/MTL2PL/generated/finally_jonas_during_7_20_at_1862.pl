:- include('database.pl').
jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

finally_jonas_during_7_20(Start,End) :- jonas(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_jonas_during_7_20_at_1862(Res) :- setof((Start,End),finally_jonas_during_7_20(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = finally_jonas_during_7_20_at_1862'), (finally_jonas_during_7_20_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

