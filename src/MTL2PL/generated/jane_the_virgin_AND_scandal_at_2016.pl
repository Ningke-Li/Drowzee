:- include('database.pl').
jane_the_virgin(Start,End) :- begin('jane_the_virgin',_,_,Start), end('jane_the_virgin',_,_,End), Start=<End.

scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

generate_facts_jane_the_virgin_AND_scandal([]) :- assert(jane_the_virgin_AND_scandal(-1,-1)).

generate_facts_jane_the_virgin_AND_scandal([(Start,End) | Tail]) :- assert(jane_the_virgin_AND_scandal(Start,End)), generate_facts_jane_the_virgin_AND_scandal(Tail).

jane_the_virgin_AND_scandal_aux() :- findall((Start,End),jane_the_virgin(Start,End),Interval1), findall((Start,End),scandal(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jane_the_virgin_AND_scandal(Interval).

jane_the_virgin_AND_scandal_at_2016(Res) :- setof((Start,End),jane_the_virgin_AND_scandal(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = jane_the_virgin_AND_scandal_at_2016'), (jane_the_virgin_AND_scandal_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jane_the_virgin_AND_scandal_aux().

