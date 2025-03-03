:- include('database.pl').
underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

finally_underground_railroad_during_1_20(Start,End) :- underground_railroad(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_underground_railroad_during_1_20_at_1862(Res) :- setof((Start,End),finally_underground_railroad_during_1_20(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = finally_underground_railroad_during_1_20_at_1862'), (finally_underground_railroad_during_1_20_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

