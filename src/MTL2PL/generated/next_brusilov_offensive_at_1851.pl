:- include('database.pl').
brusilov_offensive(Start,End) :- begin('brusilov_offensive',_,_,Start), end('brusilov_offensive',_,_,End), Start=<End.

next_brusilov_offensive(Start,End) :- brusilov_offensive(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_brusilov_offensive_at_1851(Res) :- setof((Start,End),next_brusilov_offensive(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = next_brusilov_offensive_at_1851'), (next_brusilov_offensive_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).

