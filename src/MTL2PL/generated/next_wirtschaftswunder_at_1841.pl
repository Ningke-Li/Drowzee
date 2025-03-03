:- include('database.pl').
wirtschaftswunder(Start,End) :- begin('wirtschaftswunder',_,_,Start), end('wirtschaftswunder',_,_,End), Start=<End.

next_wirtschaftswunder(Start,End) :- wirtschaftswunder(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_wirtschaftswunder_at_1841(Res) :- setof((Start,End),next_wirtschaftswunder(Start,End),AllINtervals), checkvalidity(1841,AllINtervals,Res).

check_query() :- write('Query = next_wirtschaftswunder_at_1841'), (next_wirtschaftswunder_at_1841(true) -> write('\nRes   = true');write('\nRes   = false')).

