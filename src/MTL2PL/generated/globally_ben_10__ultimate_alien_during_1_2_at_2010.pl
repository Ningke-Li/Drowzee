:- include('database.pl').
ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

globally_ben_10__ultimate_alien_during_1_2(Start,End) :- ben_10__ultimate_alien(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_ben_10__ultimate_alien_during_1_2_at_2010(Res) :- setof((Start,End),globally_ben_10__ultimate_alien_during_1_2(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = globally_ben_10__ultimate_alien_during_1_2_at_2010'), (globally_ben_10__ultimate_alien_during_1_2_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

