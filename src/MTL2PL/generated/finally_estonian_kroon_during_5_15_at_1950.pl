:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

finally_estonian_kroon_during_5_15(Start,End) :- estonian_kroon(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

finally_estonian_kroon_during_5_15_at_1950(Res) :- setof((Start,End),finally_estonian_kroon_during_5_15(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = finally_estonian_kroon_during_5_15_at_1950'), (finally_estonian_kroon_during_5_15_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).

