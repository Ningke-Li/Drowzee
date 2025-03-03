:- include('database.pl').
oh_my_ghostess(Start,End) :- begin('oh_my_ghostess',_,_,Start), end('oh_my_ghostess',_,_,End), Start=<End.

next_oh_my_ghostess(Start,End) :- oh_my_ghostess(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_oh_my_ghostess_at_2011(Res) :- setof((Start,End),next_oh_my_ghostess(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_oh_my_ghostess_at_2011'), (next_oh_my_ghostess_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

