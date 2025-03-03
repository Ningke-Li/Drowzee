:- include('database.pl').
korean_war(Start,End) :- begin('korean_war',_,_,Start), end('korean_war',_,_,End), Start=<End.

next_korean_war(Start,End) :- korean_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_korean_war_at_1952(Res) :- setof((Start,End),next_korean_war(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = next_korean_war_at_1952'), (next_korean_war_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

