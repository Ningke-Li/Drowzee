:- include('database.pl').
ev_2015_bamako_hotel_attack(Start,End) :- begin('ev_2015_bamako_hotel_attack',_,_,Start), end('ev_2015_bamako_hotel_attack',_,_,End), Start=<End.

finally_ev_2015_bamako_hotel_attack_during_4_12(Start,End) :- ev_2015_bamako_hotel_attack(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_ev_2015_bamako_hotel_attack_during_4_12_at_1942(Res) :- setof((Start,End),finally_ev_2015_bamako_hotel_attack_during_4_12(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_bamako_hotel_attack_during_4_12_at_1942'), (finally_ev_2015_bamako_hotel_attack_during_4_12_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

