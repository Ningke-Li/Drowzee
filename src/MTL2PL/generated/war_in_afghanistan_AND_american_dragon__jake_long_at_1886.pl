:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

generate_facts_war_in_afghanistan_AND_american_dragon__jake_long([]) :- assert(war_in_afghanistan_AND_american_dragon__jake_long(-1,-1)).

generate_facts_war_in_afghanistan_AND_american_dragon__jake_long([(Start,End) | Tail]) :- assert(war_in_afghanistan_AND_american_dragon__jake_long(Start,End)), generate_facts_war_in_afghanistan_AND_american_dragon__jake_long(Tail).

war_in_afghanistan_AND_american_dragon__jake_long_aux() :- findall((Start,End),war_in_afghanistan(Start,End),Interval1), findall((Start,End),american_dragon__jake_long(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_in_afghanistan_AND_american_dragon__jake_long(Interval).

war_in_afghanistan_AND_american_dragon__jake_long_at_1886(Res) :- setof((Start,End),war_in_afghanistan_AND_american_dragon__jake_long(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_AND_american_dragon__jake_long_at_1886'), (war_in_afghanistan_AND_american_dragon__jake_long_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_in_afghanistan_AND_american_dragon__jake_long_aux().

