:- include('database.pl').
smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

generate_facts_smallville_AND_american_dragon__jake_long([]) :- assert(smallville_AND_american_dragon__jake_long(-1,-1)).

generate_facts_smallville_AND_american_dragon__jake_long([(Start,End) | Tail]) :- assert(smallville_AND_american_dragon__jake_long(Start,End)), generate_facts_smallville_AND_american_dragon__jake_long(Tail).

smallville_AND_american_dragon__jake_long_aux() :- findall((Start,End),smallville(Start,End),Interval1), findall((Start,End),american_dragon__jake_long(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_smallville_AND_american_dragon__jake_long(Interval).

smallville_AND_american_dragon__jake_long_at_2006(Res) :- setof((Start,End),smallville_AND_american_dragon__jake_long(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = smallville_AND_american_dragon__jake_long_at_2006'), (smallville_AND_american_dragon__jake_long_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- smallville_AND_american_dragon__jake_long_aux().

