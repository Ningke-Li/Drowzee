:- include('database.pl').
chuck(Start,End) :- begin('chuck',_,_,Start), end('chuck',_,_,End), Start=<End.

globally_chuck_during_1_4(Start,End) :- chuck(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_chuck_during_1_4_at_2007(Res) :- setof((Start,End),globally_chuck_during_1_4(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = globally_chuck_during_1_4_at_2007'), (globally_chuck_during_1_4_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

