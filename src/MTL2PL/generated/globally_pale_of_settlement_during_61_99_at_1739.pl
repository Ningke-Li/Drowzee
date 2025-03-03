:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

globally_pale_of_settlement_during_61_99(Start,End) :- pale_of_settlement(Start1,End1), Start is (Start1-61), End is (End1-99), Start=<End.

globally_pale_of_settlement_during_61_99_at_1739(Res) :- setof((Start,End),globally_pale_of_settlement_during_61_99(Start,End),AllINtervals), checkvalidity(1739,AllINtervals,Res).

check_query() :- write('Query = globally_pale_of_settlement_during_61_99_at_1739'), (globally_pale_of_settlement_during_61_99_at_1739(true) -> write('\nRes   = true');write('\nRes   = false')).

