:- include('database.pl').
scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

qing_dynasty(Start,End) :- begin('qing_dynasty',_,_,Start), end('qing_dynasty',_,_,End), Start=<End.

generate_facts_scramble_for_africa_AND_qing_dynasty([]) :- assert(scramble_for_africa_AND_qing_dynasty(-1,-1)).

generate_facts_scramble_for_africa_AND_qing_dynasty([(Start,End) | Tail]) :- assert(scramble_for_africa_AND_qing_dynasty(Start,End)), generate_facts_scramble_for_africa_AND_qing_dynasty(Tail).

scramble_for_africa_AND_qing_dynasty_aux() :- findall((Start,End),scramble_for_africa(Start,End),Interval1), findall((Start,End),qing_dynasty(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scramble_for_africa_AND_qing_dynasty(Interval).

scramble_for_africa_AND_qing_dynasty_at_1887(Res) :- setof((Start,End),scramble_for_africa_AND_qing_dynasty(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = scramble_for_africa_AND_qing_dynasty_at_1887'), (scramble_for_africa_AND_qing_dynasty_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scramble_for_africa_AND_qing_dynasty_aux().

