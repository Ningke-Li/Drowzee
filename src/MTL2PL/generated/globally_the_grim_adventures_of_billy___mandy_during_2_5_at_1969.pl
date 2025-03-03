:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

globally_the_grim_adventures_of_billy___mandy_during_2_5(Start,End) :- the_grim_adventures_of_billy___mandy(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

globally_the_grim_adventures_of_billy___mandy_during_2_5_at_1969(Res) :- setof((Start,End),globally_the_grim_adventures_of_billy___mandy_during_2_5(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = globally_the_grim_adventures_of_billy___mandy_during_2_5_at_1969'), (globally_the_grim_adventures_of_billy___mandy_during_2_5_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

