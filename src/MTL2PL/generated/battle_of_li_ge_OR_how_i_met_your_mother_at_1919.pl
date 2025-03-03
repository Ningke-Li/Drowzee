:- include('database.pl').
battle_of_li_ge(Start,End) :- begin('battle_of_li_ge',_,_,Start), end('battle_of_li_ge',_,_,End), Start=<End.

how_i_met_your_mother(Start,End) :- begin('how_i_met_your_mother',_,_,Start), end('how_i_met_your_mother',_,_,End), Start=<End.

generate_facts_battle_of_li_ge_OR_how_i_met_your_mother([]) :- assert(battle_of_li_ge_OR_how_i_met_your_mother(-1,-1)).

generate_facts_battle_of_li_ge_OR_how_i_met_your_mother([(Start,End) | Tail]) :- assert(battle_of_li_ge_OR_how_i_met_your_mother(Start,End)), generate_facts_battle_of_li_ge_OR_how_i_met_your_mother(Tail).

battle_of_li_ge_OR_how_i_met_your_mother_aux() :- findall((Start,End),battle_of_li_ge(Start,End),Interval1), findall((Start,End),how_i_met_your_mother(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_li_ge_OR_how_i_met_your_mother(Interval).

battle_of_li_ge_OR_how_i_met_your_mother_at_1919(Res) :- setof((Start,End),battle_of_li_ge_OR_how_i_met_your_mother(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = battle_of_li_ge_OR_how_i_met_your_mother_at_1919'), (battle_of_li_ge_OR_how_i_met_your_mother_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_li_ge_OR_how_i_met_your_mother_aux().

