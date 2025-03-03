:- include('database.pl').
dark_angel(Start,End) :- begin('dark_angel',_,_,Start), end('dark_angel',_,_,End), Start=<End.

globally_dark_angel_during_1_2(Start,End) :- dark_angel(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_dark_angel_during_1_2_at_2000(Res) :- setof((Start,End),globally_dark_angel_during_1_2(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = globally_dark_angel_during_1_2_at_2000'), (globally_dark_angel_during_1_2_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

