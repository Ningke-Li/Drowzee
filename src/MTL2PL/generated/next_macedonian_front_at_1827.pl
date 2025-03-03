:- include('database.pl').
macedonian_front(Start,End) :- begin('macedonian_front',_,_,Start), end('macedonian_front',_,_,End), Start=<End.

next_macedonian_front(Start,End) :- macedonian_front(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_macedonian_front_at_1827(Res) :- setof((Start,End),next_macedonian_front(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = next_macedonian_front_at_1827'), (next_macedonian_front_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).

