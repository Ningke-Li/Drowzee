:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

globally_portuguese_escudo_during_10_86(Start,End) :- portuguese_escudo(Start1,End1), Start is (Start1-10), End is (End1-86), Start=<End.

globally_portuguese_escudo_during_10_86_at_1941(Res) :- setof((Start,End),globally_portuguese_escudo_during_10_86(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = globally_portuguese_escudo_during_10_86_at_1941'), (globally_portuguese_escudo_during_10_86_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

