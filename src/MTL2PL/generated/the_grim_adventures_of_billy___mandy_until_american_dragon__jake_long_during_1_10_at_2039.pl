:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

american_dragon__jake_long(Start,End) :- begin('american_dragon__jake_long',_,_,Start), end('american_dragon__jake_long',_,_,End), Start=<End.

the_grim_adventures_of_billy___mandy_last_till_1_10(Start,End) :- the_grim_adventures_of_billy___mandy(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10_overlap(Start,End) :- the_grim_adventures_of_billy___mandy_last_till_1_10(Start1,End1), american_dragon__jake_long(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10(Start,End) :- the_grim_adventures_of_billy___mandy(W1,_), the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10_at_2039(Res) :- setof((Start,End),the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10(Start,End),AllINtervals), checkvalidity(2039,AllINtervals,Res).

check_query() :- write('Query = the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10_at_2039'), (the_grim_adventures_of_billy___mandy_until_american_dragon__jake_long_during_1_10_at_2039(true) -> write('\nRes   = true');write('\nRes   = false')).

