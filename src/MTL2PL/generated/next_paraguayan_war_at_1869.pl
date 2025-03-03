:- include('database.pl').
paraguayan_war(Start,End) :- begin('paraguayan_war',_,_,Start), end('paraguayan_war',_,_,End), Start=<End.

next_paraguayan_war(Start,End) :- paraguayan_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_paraguayan_war_at_1869(Res) :- setof((Start,End),next_paraguayan_war(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = next_paraguayan_war_at_1869'), (next_paraguayan_war_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).

