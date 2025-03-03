:- include('database.pl').
ev_26_11_mumbai_attacks(Start,End) :- begin('ev_26_11_mumbai_attacks',_,_,Start), end('ev_26_11_mumbai_attacks',_,_,End), Start=<End.

canoeing_at_the_2016_summer_olympics(Start,End) :- begin('canoeing_at_the_2016_summer_olympics',_,_,Start), end('canoeing_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics([]) :- assert(ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics(-1,-1)).

generate_facts_ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics(Start,End)), generate_facts_ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics(Tail).

ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics_aux() :- findall((Start,End),ev_26_11_mumbai_attacks(Start,End),Interval1), findall((Start,End),canoeing_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics(Interval).

ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics_at_1897(Res) :- setof((Start,End),ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics_at_1897'), (ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_26_11_mumbai_attacks_OR_canoeing_at_the_2016_summer_olympics_aux().

