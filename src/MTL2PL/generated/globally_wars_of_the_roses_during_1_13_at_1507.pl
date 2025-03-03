:- include('database.pl').
wars_of_the_roses(Start,End) :- begin('wars_of_the_roses',_,_,Start), end('wars_of_the_roses',_,_,End), Start=<End.

globally_wars_of_the_roses_during_1_13(Start,End) :- wars_of_the_roses(Start1,End1), Start is (Start1-1), End is (End1-13), Start=<End.

globally_wars_of_the_roses_during_1_13_at_1507(Res) :- setof((Start,End),globally_wars_of_the_roses_during_1_13(Start,End),AllINtervals), checkvalidity(1507,AllINtervals,Res).

check_query() :- write('Query = globally_wars_of_the_roses_during_1_13_at_1507'), (globally_wars_of_the_roses_during_1_13_at_1507(true) -> write('\nRes   = true');write('\nRes   = false')).

