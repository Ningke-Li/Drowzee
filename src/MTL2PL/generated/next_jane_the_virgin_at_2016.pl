:- include('database.pl').
jane_the_virgin(Start,End) :- begin('jane_the_virgin',_,_,Start), end('jane_the_virgin',_,_,End), Start=<End.

next_jane_the_virgin(Start,End) :- jane_the_virgin(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_jane_the_virgin_at_2016(Res) :- setof((Start,End),next_jane_the_virgin(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = next_jane_the_virgin_at_2016'), (next_jane_the_virgin_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

