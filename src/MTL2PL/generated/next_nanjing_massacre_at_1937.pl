:- include('database.pl').
nanjing_massacre(Start,End) :- begin('nanjing_massacre',_,_,Start), end('nanjing_massacre',_,_,End), Start=<End.

next_nanjing_massacre(Start,End) :- nanjing_massacre(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_nanjing_massacre_at_1937(Res) :- setof((Start,End),next_nanjing_massacre(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = next_nanjing_massacre_at_1937'), (next_nanjing_massacre_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).

