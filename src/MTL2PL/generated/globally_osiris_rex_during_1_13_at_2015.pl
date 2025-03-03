:- include('database.pl').
osiris_rex(Start,End) :- begin('osiris_rex',_,_,Start), end('osiris_rex',_,_,End), Start=<End.

globally_osiris_rex_during_1_13(Start,End) :- osiris_rex(Start1,End1), Start is (Start1-1), End is (End1-13), Start=<End.

globally_osiris_rex_during_1_13_at_2015(Res) :- setof((Start,End),globally_osiris_rex_during_1_13(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = globally_osiris_rex_during_1_13_at_2015'), (globally_osiris_rex_during_1_13_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

