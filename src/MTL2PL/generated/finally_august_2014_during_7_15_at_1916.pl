:- include('database.pl').
august_2014(Start,End) :- begin('august_2014',_,_,Start), end('august_2014',_,_,End), Start=<End.

finally_august_2014_during_7_15(Start,End) :- august_2014(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_august_2014_during_7_15_at_1916(Res) :- setof((Start,End),finally_august_2014_during_7_15(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = finally_august_2014_during_7_15_at_1916'), (finally_august_2014_during_7_15_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).

