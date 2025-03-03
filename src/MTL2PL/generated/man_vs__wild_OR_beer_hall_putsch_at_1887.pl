:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

beer_hall_putsch(Start,End) :- begin('beer_hall_putsch',_,_,Start), end('beer_hall_putsch',_,_,End), Start=<End.

generate_facts_man_vs__wild_OR_beer_hall_putsch([]) :- assert(man_vs__wild_OR_beer_hall_putsch(-1,-1)).

generate_facts_man_vs__wild_OR_beer_hall_putsch([(Start,End) | Tail]) :- assert(man_vs__wild_OR_beer_hall_putsch(Start,End)), generate_facts_man_vs__wild_OR_beer_hall_putsch(Tail).

man_vs__wild_OR_beer_hall_putsch_aux() :- findall((Start,End),man_vs__wild(Start,End),Interval1), findall((Start,End),beer_hall_putsch(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_man_vs__wild_OR_beer_hall_putsch(Interval).

man_vs__wild_OR_beer_hall_putsch_at_1887(Res) :- setof((Start,End),man_vs__wild_OR_beer_hall_putsch(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = man_vs__wild_OR_beer_hall_putsch_at_1887'), (man_vs__wild_OR_beer_hall_putsch_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).
?- man_vs__wild_OR_beer_hall_putsch_aux().

