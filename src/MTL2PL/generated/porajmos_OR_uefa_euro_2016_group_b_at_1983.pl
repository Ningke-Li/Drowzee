:- include('database.pl').
porajmos(Start,End) :- begin('porajmos',_,_,Start), end('porajmos',_,_,End), Start=<End.

uefa_euro_2016_group_b(Start,End) :- begin('uefa_euro_2016_group_b',_,_,Start), end('uefa_euro_2016_group_b',_,_,End), Start=<End.

generate_facts_porajmos_OR_uefa_euro_2016_group_b([]) :- assert(porajmos_OR_uefa_euro_2016_group_b(-1,-1)).

generate_facts_porajmos_OR_uefa_euro_2016_group_b([(Start,End) | Tail]) :- assert(porajmos_OR_uefa_euro_2016_group_b(Start,End)), generate_facts_porajmos_OR_uefa_euro_2016_group_b(Tail).

porajmos_OR_uefa_euro_2016_group_b_aux() :- findall((Start,End),porajmos(Start,End),Interval1), findall((Start,End),uefa_euro_2016_group_b(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_porajmos_OR_uefa_euro_2016_group_b(Interval).

porajmos_OR_uefa_euro_2016_group_b_at_1983(Res) :- setof((Start,End),porajmos_OR_uefa_euro_2016_group_b(Start,End),AllINtervals), checkvalidity(1983,AllINtervals,Res).

check_query() :- write('Query = porajmos_OR_uefa_euro_2016_group_b_at_1983'), (porajmos_OR_uefa_euro_2016_group_b_at_1983(true) -> write('\nRes   = true');write('\nRes   = false')).
?- porajmos_OR_uefa_euro_2016_group_b_aux().

