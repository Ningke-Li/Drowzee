:- include('database.pl').
glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

finally_glee_during_5_14(Start,End) :- glee(Start1,End1), (Start1-14)=<(End1-5), Start is (Start1-14), End is (End1-5), Start=<End.

finally_glee_during_5_14_at_2000(Res) :- setof((Start,End),finally_glee_during_5_14(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_glee_during_5_14_at_2000'), (finally_glee_during_5_14_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

