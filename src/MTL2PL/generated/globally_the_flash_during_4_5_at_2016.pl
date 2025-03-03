:- include('database.pl').
the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

globally_the_flash_during_4_5(Start,End) :- the_flash(Start1,End1), Start is (Start1-4), End is (End1-5), Start=<End.

globally_the_flash_during_4_5_at_2016(Res) :- setof((Start,End),globally_the_flash_during_4_5(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = globally_the_flash_during_4_5_at_2016'), (globally_the_flash_during_4_5_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

