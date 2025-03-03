:- include('database.pl').
fronde(Start,End) :- begin('fronde',_,_,Start), end('fronde',_,_,End), Start=<End.

globally_fronde_during_3_4(Start,End) :- fronde(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

globally_fronde_during_3_4_at_1566(Res) :- setof((Start,End),globally_fronde_during_3_4(Start,End),AllINtervals), checkvalidity(1566,AllINtervals,Res).

check_query() :- write('Query = globally_fronde_during_3_4_at_1566'), (globally_fronde_during_3_4_at_1566(true) -> write('\nRes   = true');write('\nRes   = false')).

