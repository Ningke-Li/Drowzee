:- include('database.pl').
de_stijl(Start,End) :- begin('de_stijl',_,_,Start), end('de_stijl',_,_,End), Start=<End.

dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

generate_facts_de_stijl_AND_dutch_guilder([]) :- assert(de_stijl_AND_dutch_guilder(-1,-1)).

generate_facts_de_stijl_AND_dutch_guilder([(Start,End) | Tail]) :- assert(de_stijl_AND_dutch_guilder(Start,End)), generate_facts_de_stijl_AND_dutch_guilder(Tail).

de_stijl_AND_dutch_guilder_aux() :- findall((Start,End),de_stijl(Start,End),Interval1), findall((Start,End),dutch_guilder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_de_stijl_AND_dutch_guilder(Interval).

de_stijl_AND_dutch_guilder_at_1844(Res) :- setof((Start,End),de_stijl_AND_dutch_guilder(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = de_stijl_AND_dutch_guilder_at_1844'), (de_stijl_AND_dutch_guilder_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).
?- de_stijl_AND_dutch_guilder_aux().

