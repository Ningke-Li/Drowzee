:- include('database.pl').
orphan_black(Start,End) :- begin('orphan_black',_,_,Start), end('orphan_black',_,_,End), Start=<End.

we_bare_bears(Start,End) :- begin('we_bare_bears',_,_,Start), end('we_bare_bears',_,_,End), Start=<End.

generate_facts_orphan_black_AND_we_bare_bears([]) :- assert(orphan_black_AND_we_bare_bears(-1,-1)).

generate_facts_orphan_black_AND_we_bare_bears([(Start,End) | Tail]) :- assert(orphan_black_AND_we_bare_bears(Start,End)), generate_facts_orphan_black_AND_we_bare_bears(Tail).

orphan_black_AND_we_bare_bears_aux() :- findall((Start,End),orphan_black(Start,End),Interval1), findall((Start,End),we_bare_bears(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orphan_black_AND_we_bare_bears(Interval).

orphan_black_AND_we_bare_bears_at_1925(Res) :- setof((Start,End),orphan_black_AND_we_bare_bears(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = orphan_black_AND_we_bare_bears_at_1925'), (orphan_black_AND_we_bare_bears_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orphan_black_AND_we_bare_bears_aux().

