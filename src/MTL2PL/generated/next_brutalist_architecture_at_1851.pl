:- include('database.pl').
brutalist_architecture(Start,End) :- begin('brutalist_architecture',_,_,Start), end('brutalist_architecture',_,_,End), Start=<End.

next_brutalist_architecture(Start,End) :- brutalist_architecture(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_brutalist_architecture_at_1851(Res) :- setof((Start,End),next_brutalist_architecture(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = next_brutalist_architecture_at_1851'), (next_brutalist_architecture_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).

