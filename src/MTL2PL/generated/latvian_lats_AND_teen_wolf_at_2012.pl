:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

teen_wolf(Start,End) :- begin('teen_wolf',_,_,Start), end('teen_wolf',_,_,End), Start=<End.

generate_facts_latvian_lats_AND_teen_wolf([]) :- assert(latvian_lats_AND_teen_wolf(-1,-1)).

generate_facts_latvian_lats_AND_teen_wolf([(Start,End) | Tail]) :- assert(latvian_lats_AND_teen_wolf(Start,End)), generate_facts_latvian_lats_AND_teen_wolf(Tail).

latvian_lats_AND_teen_wolf_aux() :- findall((Start,End),latvian_lats(Start,End),Interval1), findall((Start,End),teen_wolf(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_latvian_lats_AND_teen_wolf(Interval).

latvian_lats_AND_teen_wolf_at_2012(Res) :- setof((Start,End),latvian_lats_AND_teen_wolf(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_AND_teen_wolf_at_2012'), (latvian_lats_AND_teen_wolf_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- latvian_lats_AND_teen_wolf_aux().

