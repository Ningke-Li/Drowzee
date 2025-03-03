:- include('database.pl').
sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

globally_sakoku_during_5_191(Start,End) :- sakoku(Start1,End1), Start is (Start1-5), End is (End1-191), Start=<End.

globally_sakoku_during_5_191_at_1643(Res) :- setof((Start,End),globally_sakoku_during_5_191(Start,End),AllINtervals), checkvalidity(1643,AllINtervals,Res).

check_query() :- write('Query = globally_sakoku_during_5_191_at_1643'), (globally_sakoku_during_5_191_at_1643(true) -> write('\nRes   = true');write('\nRes   = false')).

