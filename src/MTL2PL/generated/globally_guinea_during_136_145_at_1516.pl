:- include('database.pl').
guinea(Start,End) :- begin('guinea',_,_,Start), end('guinea',_,_,End), Start=<End.

globally_guinea_during_136_145(Start,End) :- guinea(Start1,End1), Start is (Start1-136), End is (End1-145), Start=<End.

globally_guinea_during_136_145_at_1516(Res) :- setof((Start,End),globally_guinea_during_136_145(Start,End),AllINtervals), checkvalidity(1516,AllINtervals,Res).

check_query() :- write('Query = globally_guinea_during_136_145_at_1516'), (globally_guinea_during_136_145_at_1516(true) -> write('\nRes   = true');write('\nRes   = false')).

