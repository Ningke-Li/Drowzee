:- include('database.pl').
nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

finally_nikita_during_6_17(Start,End) :- nikita(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

next_finally_nikita_during_6_17(Start,End) :- finally_nikita_during_6_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_nikita_during_6_17_at_1911(Res) :- setof((Start,End),next_finally_nikita_during_6_17(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = next_finally_nikita_during_6_17_at_1911'), (next_finally_nikita_during_6_17_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).

