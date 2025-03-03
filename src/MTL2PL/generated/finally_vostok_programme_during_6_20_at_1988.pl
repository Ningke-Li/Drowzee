:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

finally_vostok_programme_during_6_20(Start,End) :- vostok_programme(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

finally_vostok_programme_during_6_20_at_1988(Res) :- setof((Start,End),finally_vostok_programme_during_6_20(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = finally_vostok_programme_during_6_20_at_1988'), (finally_vostok_programme_during_6_20_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).

