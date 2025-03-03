:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

globally_harry_potter_during_1_9(Start,End) :- harry_potter(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

globally_harry_potter_during_1_9_at_2000(Res) :- setof((Start,End),globally_harry_potter_during_1_9(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = globally_harry_potter_during_1_9_at_2000'), (globally_harry_potter_during_1_9_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

