:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

globally_lazytown_during_4_5(Start,End) :- lazytown(Start1,End1), Start is (Start1-4), End is (End1-5), Start=<End.

globally_lazytown_during_4_5_at_1951(Res) :- setof((Start,End),globally_lazytown_during_4_5(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = globally_lazytown_during_4_5_at_1951'), (globally_lazytown_during_4_5_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

