:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

globally_vostok_programme_during_3_19(Start,End) :- vostok_programme(Start1,End1), Start is (Start1-3), End is (End1-19), Start=<End.

globally_vostok_programme_during_3_19_at_1990(Res) :- setof((Start,End),globally_vostok_programme_during_3_19(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = globally_vostok_programme_during_3_19_at_1990'), (globally_vostok_programme_during_3_19_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).

