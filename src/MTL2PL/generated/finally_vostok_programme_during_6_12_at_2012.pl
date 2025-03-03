:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

finally_vostok_programme_during_6_12(Start,End) :- vostok_programme(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_vostok_programme_during_6_12_at_2012(Res) :- setof((Start,End),finally_vostok_programme_during_6_12(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = finally_vostok_programme_during_6_12_at_2012'), (finally_vostok_programme_during_6_12_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

