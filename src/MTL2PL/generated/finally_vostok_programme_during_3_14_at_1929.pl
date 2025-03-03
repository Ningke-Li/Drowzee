:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

finally_vostok_programme_during_3_14(Start,End) :- vostok_programme(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_vostok_programme_during_3_14_at_1929(Res) :- setof((Start,End),finally_vostok_programme_during_3_14(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = finally_vostok_programme_during_3_14_at_1929'), (finally_vostok_programme_during_3_14_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

