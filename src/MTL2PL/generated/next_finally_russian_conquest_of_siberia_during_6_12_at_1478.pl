:- include('database.pl').
russian_conquest_of_siberia(Start,End) :- begin('russian_conquest_of_siberia',_,_,Start), end('russian_conquest_of_siberia',_,_,End), Start=<End.

finally_russian_conquest_of_siberia_during_6_12(Start,End) :- russian_conquest_of_siberia(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

next_finally_russian_conquest_of_siberia_during_6_12(Start,End) :- finally_russian_conquest_of_siberia_during_6_12(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_russian_conquest_of_siberia_during_6_12_at_1478(Res) :- setof((Start,End),next_finally_russian_conquest_of_siberia_during_6_12(Start,End),AllINtervals), checkvalidity(1478,AllINtervals,Res).

check_query() :- write('Query = next_finally_russian_conquest_of_siberia_during_6_12_at_1478'), (next_finally_russian_conquest_of_siberia_during_6_12_at_1478(true) -> write('\nRes   = true');write('\nRes   = false')).

