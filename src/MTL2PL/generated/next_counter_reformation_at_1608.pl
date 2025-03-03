:- include('database.pl').
counter_reformation(Start,End) :- begin('counter_reformation',_,_,Start), end('counter_reformation',_,_,End), Start=<End.

next_counter_reformation(Start,End) :- counter_reformation(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_counter_reformation_at_1608(Res) :- setof((Start,End),next_counter_reformation(Start,End),AllINtervals), checkvalidity(1608,AllINtervals,Res).

check_query() :- write('Query = next_counter_reformation_at_1608'), (next_counter_reformation_at_1608(true) -> write('\nRes   = true');write('\nRes   = false')).

