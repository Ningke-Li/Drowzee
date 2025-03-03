:- include('database.pl').
east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

next_east_german_mark(Start,End) :- east_german_mark(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_east_german_mark_at_1971(Res) :- setof((Start,End),next_east_german_mark(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = next_east_german_mark_at_1971'), (next_east_german_mark_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).

