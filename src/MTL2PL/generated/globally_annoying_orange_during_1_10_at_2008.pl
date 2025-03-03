:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

globally_annoying_orange_during_1_10(Start,End) :- annoying_orange(Start1,End1), Start is (Start1-1), End is (End1-10), Start=<End.

globally_annoying_orange_during_1_10_at_2008(Res) :- setof((Start,End),globally_annoying_orange_during_1_10(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = globally_annoying_orange_during_1_10_at_2008'), (globally_annoying_orange_during_1_10_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

