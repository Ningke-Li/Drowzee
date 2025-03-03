:- include('database.pl').
surrealism(Start,End) :- begin('surrealism',_,_,Start), end('surrealism',_,_,End), Start=<End.

finally_surrealism_during_9_14(Start,End) :- surrealism(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

finally_surrealism_during_9_14_at_1911(Res) :- setof((Start,End),finally_surrealism_during_9_14(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = finally_surrealism_during_9_14_at_1911'), (finally_surrealism_during_9_14_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).

