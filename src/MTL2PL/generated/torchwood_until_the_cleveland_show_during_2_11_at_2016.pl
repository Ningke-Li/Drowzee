:- include('database.pl').
torchwood(Start,End) :- begin('torchwood',_,_,Start), end('torchwood',_,_,End), Start=<End.

the_cleveland_show(Start,End) :- begin('the_cleveland_show',_,_,Start), end('the_cleveland_show',_,_,End), Start=<End.

torchwood_last_till_2_11(Start,End) :- torchwood(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

torchwood_until_the_cleveland_show_during_2_11_overlap(Start,End) :- torchwood_last_till_2_11(Start1,End1), the_cleveland_show(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

torchwood_until_the_cleveland_show_during_2_11(Start,End) :- torchwood(W1,_), torchwood_until_the_cleveland_show_during_2_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-2), Start=<End.

torchwood_until_the_cleveland_show_during_2_11_at_2016(Res) :- setof((Start,End),torchwood_until_the_cleveland_show_during_2_11(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = torchwood_until_the_cleveland_show_during_2_11_at_2016'), (torchwood_until_the_cleveland_show_during_2_11_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

