:- include('database.pl').
neoclassicism(Start,End) :- begin('neoclassicism',_,_,Start), end('neoclassicism',_,_,End), Start=<End.

globally_neoclassicism_during_2_52(Start,End) :- neoclassicism(Start1,End1), Start is (Start1-2), End is (End1-52), Start=<End.

globally_neoclassicism_during_2_52_at_1784(Res) :- setof((Start,End),globally_neoclassicism_during_2_52(Start,End),AllINtervals), checkvalidity(1784,AllINtervals,Res).

check_query() :- write('Query = globally_neoclassicism_during_2_52_at_1784'), (globally_neoclassicism_during_2_52_at_1784(true) -> write('\nRes   = true');write('\nRes   = false')).

