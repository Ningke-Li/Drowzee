:- include('database.pl').
ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

next_ben_10__ultimate_alien(Start,End) :- ben_10__ultimate_alien(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ben_10__ultimate_alien_at_1960(Res) :- setof((Start,End),next_ben_10__ultimate_alien(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = next_ben_10__ultimate_alien_at_1960'), (next_ben_10__ultimate_alien_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).

