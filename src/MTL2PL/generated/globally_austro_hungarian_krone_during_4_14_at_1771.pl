:- include('database.pl').
austro_hungarian_krone(Start,End) :- begin('austro_hungarian_krone',_,_,Start), end('austro_hungarian_krone',_,_,End), Start=<End.

globally_austro_hungarian_krone_during_4_14(Start,End) :- austro_hungarian_krone(Start1,End1), Start is (Start1-4), End is (End1-14), Start=<End.

globally_austro_hungarian_krone_during_4_14_at_1771(Res) :- setof((Start,End),globally_austro_hungarian_krone_during_4_14(Start,End),AllINtervals), checkvalidity(1771,AllINtervals,Res).

check_query() :- write('Query = globally_austro_hungarian_krone_during_4_14_at_1771'), (globally_austro_hungarian_krone_during_4_14_at_1771(true) -> write('\nRes   = true');write('\nRes   = false')).

