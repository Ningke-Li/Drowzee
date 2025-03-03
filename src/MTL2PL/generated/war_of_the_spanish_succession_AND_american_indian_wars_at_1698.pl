:- include('database.pl').
war_of_the_spanish_succession(Start,End) :- begin('war_of_the_spanish_succession',_,_,Start), end('war_of_the_spanish_succession',_,_,End), Start=<End.

american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

generate_facts_war_of_the_spanish_succession_AND_american_indian_wars([]) :- assert(war_of_the_spanish_succession_AND_american_indian_wars(-1,-1)).

generate_facts_war_of_the_spanish_succession_AND_american_indian_wars([(Start,End) | Tail]) :- assert(war_of_the_spanish_succession_AND_american_indian_wars(Start,End)), generate_facts_war_of_the_spanish_succession_AND_american_indian_wars(Tail).

war_of_the_spanish_succession_AND_american_indian_wars_aux() :- findall((Start,End),war_of_the_spanish_succession(Start,End),Interval1), findall((Start,End),american_indian_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_of_the_spanish_succession_AND_american_indian_wars(Interval).

war_of_the_spanish_succession_AND_american_indian_wars_at_1698(Res) :- setof((Start,End),war_of_the_spanish_succession_AND_american_indian_wars(Start,End),AllINtervals), checkvalidity(1698,AllINtervals,Res).

check_query() :- write('Query = war_of_the_spanish_succession_AND_american_indian_wars_at_1698'), (war_of_the_spanish_succession_AND_american_indian_wars_at_1698(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_of_the_spanish_succession_AND_american_indian_wars_aux().

