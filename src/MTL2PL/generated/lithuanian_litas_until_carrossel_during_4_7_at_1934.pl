:- include('database.pl').
lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

carrossel(Start,End) :- begin('carrossel',_,_,Start), end('carrossel',_,_,End), Start=<End.

lithuanian_litas_last_till_4_7(Start,End) :- lithuanian_litas(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

lithuanian_litas_until_carrossel_during_4_7_overlap(Start,End) :- lithuanian_litas_last_till_4_7(Start1,End1), carrossel(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lithuanian_litas_until_carrossel_during_4_7(Start,End) :- lithuanian_litas(W1,_), lithuanian_litas_until_carrossel_during_4_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-4), Start=<End.

lithuanian_litas_until_carrossel_during_4_7_at_1934(Res) :- setof((Start,End),lithuanian_litas_until_carrossel_during_4_7(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = lithuanian_litas_until_carrossel_during_4_7_at_1934'), (lithuanian_litas_until_carrossel_during_4_7_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

