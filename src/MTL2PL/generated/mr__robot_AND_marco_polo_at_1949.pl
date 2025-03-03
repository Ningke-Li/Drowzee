:- include('database.pl').
mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

marco_polo(Start,End) :- begin('marco_polo',_,_,Start), end('marco_polo',_,_,End), Start=<End.

generate_facts_mr__robot_AND_marco_polo([]) :- assert(mr__robot_AND_marco_polo(-1,-1)).

generate_facts_mr__robot_AND_marco_polo([(Start,End) | Tail]) :- assert(mr__robot_AND_marco_polo(Start,End)), generate_facts_mr__robot_AND_marco_polo(Tail).

mr__robot_AND_marco_polo_aux() :- findall((Start,End),mr__robot(Start,End),Interval1), findall((Start,End),marco_polo(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mr__robot_AND_marco_polo(Interval).

mr__robot_AND_marco_polo_at_1949(Res) :- setof((Start,End),mr__robot_AND_marco_polo(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = mr__robot_AND_marco_polo_at_1949'), (mr__robot_AND_marco_polo_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mr__robot_AND_marco_polo_aux().

