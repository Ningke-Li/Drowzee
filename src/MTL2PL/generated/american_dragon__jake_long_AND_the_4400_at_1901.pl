:- include('database.pl').
american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

the_4400(Start,End) :- begin('the_4400',_,_,Start), end('the_4400',_,_,End), Start=<End.

generate_facts_american_dragon__jake_long_AND_the_4400([]) :- assert(american_dragon__jake_long_AND_the_4400(-1,-1)).

generate_facts_american_dragon__jake_long_AND_the_4400([(Start,End) | Tail]) :- assert(american_dragon__jake_long_AND_the_4400(Start,End)), generate_facts_american_dragon__jake_long_AND_the_4400(Tail).

american_dragon__jake_long_AND_the_4400_aux() :- findall((Start,End),american_dragon__jake_long(Start,End),Interval1), findall((Start,End),the_4400(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_american_dragon__jake_long_AND_the_4400(Interval).

american_dragon__jake_long_AND_the_4400_at_1901(Res) :- setof((Start,End),american_dragon__jake_long_AND_the_4400(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = american_dragon__jake_long_AND_the_4400_at_1901'), (american_dragon__jake_long_AND_the_4400_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- american_dragon__jake_long_AND_the_4400_aux().

