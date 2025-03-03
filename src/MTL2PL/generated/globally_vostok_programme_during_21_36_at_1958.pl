:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

globally_vostok_programme_during_21_36(Start,End) :- vostok_programme(Start1,End1), Start is (Start1-21), End is (End1-36), Start=<End.

globally_vostok_programme_during_21_36_at_1958(Res) :- setof((Start,End),globally_vostok_programme_during_21_36(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = globally_vostok_programme_during_21_36_at_1958'), (globally_vostok_programme_during_21_36_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).

