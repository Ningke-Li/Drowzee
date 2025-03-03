:- include('database.pl').
surrealism(Start,End) :- begin('surrealism',_,_,Start), end('surrealism',_,_,End), Start=<End.

globally_surrealism_during_6_58(Start,End) :- surrealism(Start1,End1), Start is (Start1-6), End is (End1-58), Start=<End.

globally_surrealism_during_6_58_at_1900(Res) :- setof((Start,End),globally_surrealism_during_6_58(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = globally_surrealism_during_6_58_at_1900'), (globally_surrealism_during_6_58_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

