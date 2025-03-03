:- include('database.pl').
battle_of_suomussalmi(Start,End) :- begin('battle_of_suomussalmi',_,_,Start), end('battle_of_suomussalmi',_,_,End), Start=<End.

austrian_schilling(Start,End) :- begin('austrian_schilling',_,_,Start), end('austrian_schilling',_,_,End), Start=<End.

generate_facts_battle_of_suomussalmi_AND_austrian_schilling([]) :- assert(battle_of_suomussalmi_AND_austrian_schilling(-1,-1)).

generate_facts_battle_of_suomussalmi_AND_austrian_schilling([(Start,End) | Tail]) :- assert(battle_of_suomussalmi_AND_austrian_schilling(Start,End)), generate_facts_battle_of_suomussalmi_AND_austrian_schilling(Tail).

battle_of_suomussalmi_AND_austrian_schilling_aux() :- findall((Start,End),battle_of_suomussalmi(Start,End),Interval1), findall((Start,End),austrian_schilling(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_battle_of_suomussalmi_AND_austrian_schilling(Interval).

battle_of_suomussalmi_AND_austrian_schilling_at_1818(Res) :- setof((Start,End),battle_of_suomussalmi_AND_austrian_schilling(Start,End),AllINtervals), checkvalidity(1818,AllINtervals,Res).

check_query() :- write('Query = battle_of_suomussalmi_AND_austrian_schilling_at_1818'), (battle_of_suomussalmi_AND_austrian_schilling_at_1818(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_suomussalmi_AND_austrian_schilling_aux().

