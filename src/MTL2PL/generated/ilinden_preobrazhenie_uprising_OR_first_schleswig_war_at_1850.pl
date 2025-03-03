:- include('database.pl').
ilinden_preobrazhenie_uprising(Start,End) :- begin('ilinden_preobrazhenie_uprising',_,_,Start), end('ilinden_preobrazhenie_uprising',_,_,End), Start=<End.

first_schleswig_war(Start,End) :- begin('first_schleswig_war',_,_,Start), end('first_schleswig_war',_,_,End), Start=<End.

generate_facts_ilinden_preobrazhenie_uprising_OR_first_schleswig_war([]) :- assert(ilinden_preobrazhenie_uprising_OR_first_schleswig_war(-1,-1)).

generate_facts_ilinden_preobrazhenie_uprising_OR_first_schleswig_war([(Start,End) | Tail]) :- assert(ilinden_preobrazhenie_uprising_OR_first_schleswig_war(Start,End)), generate_facts_ilinden_preobrazhenie_uprising_OR_first_schleswig_war(Tail).

ilinden_preobrazhenie_uprising_OR_first_schleswig_war_aux() :- findall((Start,End),ilinden_preobrazhenie_uprising(Start,End),Interval1), findall((Start,End),first_schleswig_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ilinden_preobrazhenie_uprising_OR_first_schleswig_war(Interval).

ilinden_preobrazhenie_uprising_OR_first_schleswig_war_at_1850(Res) :- setof((Start,End),ilinden_preobrazhenie_uprising_OR_first_schleswig_war(Start,End),AllINtervals), checkvalidity(1850,AllINtervals,Res).

check_query() :- write('Query = ilinden_preobrazhenie_uprising_OR_first_schleswig_war_at_1850'), (ilinden_preobrazhenie_uprising_OR_first_schleswig_war_at_1850(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ilinden_preobrazhenie_uprising_OR_first_schleswig_war_aux().

