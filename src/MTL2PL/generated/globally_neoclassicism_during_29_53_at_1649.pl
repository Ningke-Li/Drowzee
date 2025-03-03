:- include('database.pl').
neoclassicism(Start,End) :- begin('neoclassicism',_,_,Start), end('neoclassicism',_,_,End), Start=<End.

globally_neoclassicism_during_29_53(Start,End) :- neoclassicism(Start1,End1), Start is (Start1-29), End is (End1-53), Start=<End.

globally_neoclassicism_during_29_53_at_1649(Res) :- setof((Start,End),globally_neoclassicism_during_29_53(Start,End),AllINtervals), checkvalidity(1649,AllINtervals,Res).

check_query() :- write('Query = globally_neoclassicism_during_29_53_at_1649'), (globally_neoclassicism_during_29_53_at_1649(true) -> write('\nRes   = true');write('\nRes   = false')).

