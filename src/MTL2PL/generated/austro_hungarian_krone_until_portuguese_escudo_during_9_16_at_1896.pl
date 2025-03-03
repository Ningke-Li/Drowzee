:- include('database.pl').
austro_hungarian_krone(Start,End) :- begin('austro_hungarian_krone',_,_,Start), end('austro_hungarian_krone',_,_,End), Start=<End.

portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

austro_hungarian_krone_last_till_9_16(Start,End) :- austro_hungarian_krone(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

austro_hungarian_krone_until_portuguese_escudo_during_9_16_overlap(Start,End) :- austro_hungarian_krone_last_till_9_16(Start1,End1), portuguese_escudo(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

austro_hungarian_krone_until_portuguese_escudo_during_9_16(Start,End) :- austro_hungarian_krone(W1,_), austro_hungarian_krone_until_portuguese_escudo_during_9_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-9), Start=<End.

austro_hungarian_krone_until_portuguese_escudo_during_9_16_at_1896(Res) :- setof((Start,End),austro_hungarian_krone_until_portuguese_escudo_during_9_16(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = austro_hungarian_krone_until_portuguese_escudo_during_9_16_at_1896'), (austro_hungarian_krone_until_portuguese_escudo_during_9_16_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).

