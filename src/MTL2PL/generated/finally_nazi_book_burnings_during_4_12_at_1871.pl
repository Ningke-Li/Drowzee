:- include('database.pl').
nazi_book_burnings(Start,End) :- begin('nazi_book_burnings',_,_,Start), end('nazi_book_burnings',_,_,End), Start=<End.

finally_nazi_book_burnings_during_4_12(Start,End) :- nazi_book_burnings(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_nazi_book_burnings_during_4_12_at_1871(Res) :- setof((Start,End),finally_nazi_book_burnings_during_4_12(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = finally_nazi_book_burnings_during_4_12_at_1871'), (finally_nazi_book_burnings_during_4_12_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

