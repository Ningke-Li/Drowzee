:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

totally_spies__last_till_6_12(Start,End) :- totally_spies_(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

totally_spies__until_sherlock_during_6_12_overlap(Start,End) :- totally_spies__last_till_6_12(Start1,End1), sherlock(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

totally_spies__until_sherlock_during_6_12(Start,End) :- totally_spies_(W1,_), totally_spies__until_sherlock_during_6_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-6), Start=<End.

totally_spies__until_sherlock_during_6_12_at_2003(Res) :- setof((Start,End),totally_spies__until_sherlock_during_6_12(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = totally_spies__until_sherlock_during_6_12_at_2003'), (totally_spies__until_sherlock_during_6_12_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

