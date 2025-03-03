:- include('database.pl').
georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

globally_georgian_architecture_during_58_111(Start,End) :- georgian_architecture(Start1,End1), Start is (Start1-58), End is (End1-111), Start=<End.

globally_georgian_architecture_during_58_111_at_1673(Res) :- setof((Start,End),globally_georgian_architecture_during_58_111(Start,End),AllINtervals), checkvalidity(1673,AllINtervals,Res).

check_query() :- write('Query = globally_georgian_architecture_during_58_111_at_1673'), (globally_georgian_architecture_during_58_111_at_1673(true) -> write('\nRes   = true');write('\nRes   = false')).

