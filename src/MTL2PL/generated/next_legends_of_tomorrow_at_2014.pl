:- include('database.pl').
legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

next_legends_of_tomorrow(Start,End) :- legends_of_tomorrow(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_legends_of_tomorrow_at_2014(Res) :- setof((Start,End),next_legends_of_tomorrow(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = next_legends_of_tomorrow_at_2014'), (next_legends_of_tomorrow_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

