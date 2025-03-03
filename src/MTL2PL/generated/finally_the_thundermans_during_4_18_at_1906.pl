:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

finally_the_thundermans_during_4_18(Start,End) :- the_thundermans(Start1,End1), (Start1-18)=<(End1-4), Start is (Start1-18), End is (End1-4), Start=<End.

finally_the_thundermans_during_4_18_at_1906(Res) :- setof((Start,End),finally_the_thundermans_during_4_18(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = finally_the_thundermans_during_4_18_at_1906'), (finally_the_thundermans_during_4_18_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).

