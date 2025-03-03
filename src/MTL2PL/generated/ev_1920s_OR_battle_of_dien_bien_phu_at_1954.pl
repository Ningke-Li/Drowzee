:- include('database.pl').
ev_1920s(Start,End) :- begin('ev_1920s',_,_,Start), end('ev_1920s',_,_,End), Start=<End.

battle_of_dien_bien_phu(Start,End) :- begin('battle_of_dien_bien_phu',_,_,Start), end('battle_of_dien_bien_phu',_,_,End), Start=<End.

generate_facts_ev_1920s_OR_battle_of_dien_bien_phu([]) :- assert(ev_1920s_OR_battle_of_dien_bien_phu(-1,-1)).

generate_facts_ev_1920s_OR_battle_of_dien_bien_phu([(Start,End) | Tail]) :- assert(ev_1920s_OR_battle_of_dien_bien_phu(Start,End)), generate_facts_ev_1920s_OR_battle_of_dien_bien_phu(Tail).

ev_1920s_OR_battle_of_dien_bien_phu_aux() :- findall((Start,End),ev_1920s(Start,End),Interval1), findall((Start,End),battle_of_dien_bien_phu(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1920s_OR_battle_of_dien_bien_phu(Interval).

ev_1920s_OR_battle_of_dien_bien_phu_at_1954(Res) :- setof((Start,End),ev_1920s_OR_battle_of_dien_bien_phu(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = ev_1920s_OR_battle_of_dien_bien_phu_at_1954'), (ev_1920s_OR_battle_of_dien_bien_phu_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1920s_OR_battle_of_dien_bien_phu_aux().

