:- include('database.pl').
ev_1958_59_european_cup(Start,End) :- begin('ev_1958_59_european_cup',_,_,Start), end('ev_1958_59_european_cup',_,_,End), Start=<End.

lenin_peace_prize(Start,End) :- begin('lenin_peace_prize',_,_,Start), end('lenin_peace_prize',_,_,End), Start=<End.

generate_facts_ev_1958_59_european_cup_AND_lenin_peace_prize([]) :- assert(ev_1958_59_european_cup_AND_lenin_peace_prize(-1,-1)).

generate_facts_ev_1958_59_european_cup_AND_lenin_peace_prize([(Start,End) | Tail]) :- assert(ev_1958_59_european_cup_AND_lenin_peace_prize(Start,End)), generate_facts_ev_1958_59_european_cup_AND_lenin_peace_prize(Tail).

ev_1958_59_european_cup_AND_lenin_peace_prize_aux() :- findall((Start,End),ev_1958_59_european_cup(Start,End),Interval1), findall((Start,End),lenin_peace_prize(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1958_59_european_cup_AND_lenin_peace_prize(Interval).

ev_1958_59_european_cup_AND_lenin_peace_prize_at_1959(Res) :- setof((Start,End),ev_1958_59_european_cup_AND_lenin_peace_prize(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = ev_1958_59_european_cup_AND_lenin_peace_prize_at_1959'), (ev_1958_59_european_cup_AND_lenin_peace_prize_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1958_59_european_cup_AND_lenin_peace_prize_aux().

