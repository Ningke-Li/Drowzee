:- include('database.pl').
we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

finally_we_bare_bears_during_5_11(Start,End) :- we_bare_bears(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

finally_we_bare_bears_during_5_11_at_2004(Res) :- setof((Start,End),finally_we_bare_bears_during_5_11(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = finally_we_bare_bears_during_5_11_at_2004'), (finally_we_bare_bears_during_5_11_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

