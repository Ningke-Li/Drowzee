:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

generate_facts_new_imperialism_OR_ben_10__ultimate_alien([]) :- assert(new_imperialism_OR_ben_10__ultimate_alien(-1,-1)).

generate_facts_new_imperialism_OR_ben_10__ultimate_alien([(Start,End) | Tail]) :- assert(new_imperialism_OR_ben_10__ultimate_alien(Start,End)), generate_facts_new_imperialism_OR_ben_10__ultimate_alien(Tail).

new_imperialism_OR_ben_10__ultimate_alien_aux() :- findall((Start,End),new_imperialism(Start,End),Interval1), findall((Start,End),ben_10__ultimate_alien(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_new_imperialism_OR_ben_10__ultimate_alien(Interval).

new_imperialism_OR_ben_10__ultimate_alien_at_1913(Res) :- setof((Start,End),new_imperialism_OR_ben_10__ultimate_alien(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_OR_ben_10__ultimate_alien_at_1913'), (new_imperialism_OR_ben_10__ultimate_alien_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_imperialism_OR_ben_10__ultimate_alien_aux().

