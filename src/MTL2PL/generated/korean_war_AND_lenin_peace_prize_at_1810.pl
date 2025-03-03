:- include('database.pl').
korean_war(Start,End) :- begin('korean_war',_,_,Start), end('korean_war',_,_,End), Start=<End.

lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

generate_facts_korean_war_AND_lenin_peace_prize([]) :- assert(korean_war_AND_lenin_peace_prize(-1,-1)).

generate_facts_korean_war_AND_lenin_peace_prize([(Start,End) | Tail]) :- assert(korean_war_AND_lenin_peace_prize(Start,End)), generate_facts_korean_war_AND_lenin_peace_prize(Tail).

korean_war_AND_lenin_peace_prize_aux() :- findall((Start,End),korean_war(Start,End),Interval1), findall((Start,End),lenin_peace_prize(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_korean_war_AND_lenin_peace_prize(Interval).

korean_war_AND_lenin_peace_prize_at_1810(Res) :- setof((Start,End),korean_war_AND_lenin_peace_prize(Start,End),AllINtervals), checkvalidity(1810,AllINtervals,Res).

check_query() :- write('Query = korean_war_AND_lenin_peace_prize_at_1810'), (korean_war_AND_lenin_peace_prize_at_1810(true) -> write('\nRes   = true');write('\nRes   = false')).
?- korean_war_AND_lenin_peace_prize_aux().

