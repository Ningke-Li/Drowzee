:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

japanese_economic_miracle(Start,End) :- begin('japanese_economic_miracle',_,_,Start), end('japanese_economic_miracle',_,_,End), Start=<End.

generate_facts_phoney_war_AND_japanese_economic_miracle([]) :- assert(phoney_war_AND_japanese_economic_miracle(-1,-1)).

generate_facts_phoney_war_AND_japanese_economic_miracle([(Start,End) | Tail]) :- assert(phoney_war_AND_japanese_economic_miracle(Start,End)), generate_facts_phoney_war_AND_japanese_economic_miracle(Tail).

phoney_war_AND_japanese_economic_miracle_aux() :- findall((Start,End),phoney_war(Start,End),Interval1), findall((Start,End),japanese_economic_miracle(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_phoney_war_AND_japanese_economic_miracle(Interval).

phoney_war_AND_japanese_economic_miracle_at_1932(Res) :- setof((Start,End),phoney_war_AND_japanese_economic_miracle(Start,End),AllINtervals), checkvalidity(1932,AllINtervals,Res).

check_query() :- write('Query = phoney_war_AND_japanese_economic_miracle_at_1932'), (phoney_war_AND_japanese_economic_miracle_at_1932(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phoney_war_AND_japanese_economic_miracle_aux().

