:- include('database.pl').
post_impressionism(Start,End) :- begin('post_impressionism',_,_,Start), end('post_impressionism',_,_,End), Start=<End.

aktion_t4(Start,End) :- begin('aktion_t4',_,_,Start), end('aktion_t4',_,_,End), Start=<End.

generate_facts_post_impressionism_OR_aktion_t4([]) :- assert(post_impressionism_OR_aktion_t4(-1,-1)).

generate_facts_post_impressionism_OR_aktion_t4([(Start,End) | Tail]) :- assert(post_impressionism_OR_aktion_t4(Start,End)), generate_facts_post_impressionism_OR_aktion_t4(Tail).

post_impressionism_OR_aktion_t4_aux() :- findall((Start,End),post_impressionism(Start,End),Interval1), findall((Start,End),aktion_t4(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_post_impressionism_OR_aktion_t4(Interval).

post_impressionism_OR_aktion_t4_at_1945(Res) :- setof((Start,End),post_impressionism_OR_aktion_t4(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = post_impressionism_OR_aktion_t4_at_1945'), (post_impressionism_OR_aktion_t4_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- post_impressionism_OR_aktion_t4_aux().

