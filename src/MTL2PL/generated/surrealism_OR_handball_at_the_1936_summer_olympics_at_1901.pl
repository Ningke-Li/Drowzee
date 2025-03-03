:- include('database.pl').
surrealism(Start,End) :- begin('surrealism',_,_,Start), end('surrealism',_,_,End), Start=<End.

handball_at_the_1936_summer_olympics(Start,End) :- begin('handball_at_the_1936_summer_olympics',_,_,Start), end('handball_at_the_1936_summer_olympics',_,_,End), Start=<End.

generate_facts_surrealism_OR_handball_at_the_1936_summer_olympics([]) :- assert(surrealism_OR_handball_at_the_1936_summer_olympics(-1,-1)).

generate_facts_surrealism_OR_handball_at_the_1936_summer_olympics([(Start,End) | Tail]) :- assert(surrealism_OR_handball_at_the_1936_summer_olympics(Start,End)), generate_facts_surrealism_OR_handball_at_the_1936_summer_olympics(Tail).

surrealism_OR_handball_at_the_1936_summer_olympics_aux() :- findall((Start,End),surrealism(Start,End),Interval1), findall((Start,End),handball_at_the_1936_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_surrealism_OR_handball_at_the_1936_summer_olympics(Interval).

surrealism_OR_handball_at_the_1936_summer_olympics_at_1901(Res) :- setof((Start,End),surrealism_OR_handball_at_the_1936_summer_olympics(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = surrealism_OR_handball_at_the_1936_summer_olympics_at_1901'), (surrealism_OR_handball_at_the_1936_summer_olympics_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- surrealism_OR_handball_at_the_1936_summer_olympics_aux().

