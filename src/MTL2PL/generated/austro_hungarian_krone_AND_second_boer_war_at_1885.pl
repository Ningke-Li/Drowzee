:- include('database.pl').
austro_hungarian_krone(Start,End) :- begin('austro_hungarian_krone',_,_,Start), end('austro_hungarian_krone',_,_,End), Start=<End.

second_boer_war(Start,End) :- begin('second_boer_war',_,_,Start), end('second_boer_war',_,_,End), Start=<End.

generate_facts_austro_hungarian_krone_AND_second_boer_war([]) :- assert(austro_hungarian_krone_AND_second_boer_war(-1,-1)).

generate_facts_austro_hungarian_krone_AND_second_boer_war([(Start,End) | Tail]) :- assert(austro_hungarian_krone_AND_second_boer_war(Start,End)), generate_facts_austro_hungarian_krone_AND_second_boer_war(Tail).

austro_hungarian_krone_AND_second_boer_war_aux() :- findall((Start,End),austro_hungarian_krone(Start,End),Interval1), findall((Start,End),second_boer_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_austro_hungarian_krone_AND_second_boer_war(Interval).

austro_hungarian_krone_AND_second_boer_war_at_1885(Res) :- setof((Start,End),austro_hungarian_krone_AND_second_boer_war(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = austro_hungarian_krone_AND_second_boer_war_at_1885'), (austro_hungarian_krone_AND_second_boer_war_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austro_hungarian_krone_AND_second_boer_war_aux().

