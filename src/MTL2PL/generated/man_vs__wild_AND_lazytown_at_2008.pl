:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

generate_facts_man_vs__wild_AND_lazytown([]) :- assert(man_vs__wild_AND_lazytown(-1,-1)).

generate_facts_man_vs__wild_AND_lazytown([(Start,End) | Tail]) :- assert(man_vs__wild_AND_lazytown(Start,End)), generate_facts_man_vs__wild_AND_lazytown(Tail).

man_vs__wild_AND_lazytown_aux() :- findall((Start,End),man_vs__wild(Start,End),Interval1), findall((Start,End),lazytown(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_man_vs__wild_AND_lazytown(Interval).

man_vs__wild_AND_lazytown_at_2008(Res) :- setof((Start,End),man_vs__wild_AND_lazytown(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = man_vs__wild_AND_lazytown_at_2008'), (man_vs__wild_AND_lazytown_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- man_vs__wild_AND_lazytown_aux().

