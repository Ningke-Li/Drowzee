:- include('database.pl').
the_l_word(Start,End) :- begin('the_l_word',_,_,Start), end('the_l_word',_,_,End), Start=<End.

next_the_l_word(Start,End) :- the_l_word(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_l_word_at_1854(Res) :- setof((Start,End),next_the_l_word(Start,End),AllINtervals), checkvalidity(1854,AllINtervals,Res).

check_query() :- write('Query = next_the_l_word_at_1854'), (next_the_l_word_at_1854(true) -> write('\nRes   = true');write('\nRes   = false')).

