:- include('database.pl').
allied_invasion_of_sicily(Start,End) :- begin('allied_invasion_of_sicily',_,_,Start), end('allied_invasion_of_sicily',_,_,End), Start=<End.

finally_allied_invasion_of_sicily_during_2_18(Start,End) :- allied_invasion_of_sicily(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

finally_allied_invasion_of_sicily_during_2_18_at_1939(Res) :- setof((Start,End),finally_allied_invasion_of_sicily_during_2_18(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = finally_allied_invasion_of_sicily_during_2_18_at_1939'), (finally_allied_invasion_of_sicily_during_2_18_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

