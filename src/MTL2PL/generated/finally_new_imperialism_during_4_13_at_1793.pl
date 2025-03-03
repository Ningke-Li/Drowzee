:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

finally_new_imperialism_during_4_13(Start,End) :- new_imperialism(Start1,End1), (Start1-13)=<(End1-4), Start is (Start1-13), End is (End1-4), Start=<End.

finally_new_imperialism_during_4_13_at_1793(Res) :- setof((Start,End),finally_new_imperialism_during_4_13(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = finally_new_imperialism_during_4_13_at_1793'), (finally_new_imperialism_during_4_13_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).

