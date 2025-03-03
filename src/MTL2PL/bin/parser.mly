%{ open Ast_utility %}
%{ open List %}

%token <string> VAR
%token <int> INTE
%token EMPTY LPAR RPAR CONCAT  POWER  DISJ   
%token COLON  REQUIRE ENSURE FUTURESpec LSPEC RSPEC SEMI
%token UNDERLINE KLEENE EOF BOTTOM NOTSINGLE 
%token GT LT EQ GTEQ LTEQ CONJ COMMA MINUS 
%token PLUS TRUE FALSE 
%token FUTURE GLOBAL IMPLY NEG NEXT UNTIL ATOM Lbracket Rbracket
%left DISJ 
%left CONCAT

%start mtlQueries
%type <(Ast_utility.mtl)> mtl
%type <(Ast_utility.propositions)> propositions
%type <(Ast_utility.interval)> interval
%type <((Ast_utility.mtl * int) list)> mtlQueries




%%

mtlQueries:
| EOF {[]}
| mtl = mtl COMMA i=INTE SEMI rest= mtlQueries {(mtl, i):: rest}

propositions:
| str = VAR {(str, [])}

interval:
| Lbracket start= INTE COMMA endp= INTE Rbracket {(start, endp)}
| Lbracket LPAR start= INTE COMMA endp= INTE RPAR Rbracket {(start, endp)}

mtl:
| ATOM LPAR p = propositions RPAR {Atom p} 
| NEXT LPAR p = mtl RPAR {Next p}
| UNTIL i=interval LPAR p1= mtl COMMA p2= mtl RPAR  
{Until (i, p1, p2)}
| GLOBAL i=interval LPAR p = mtl RPAR {Globally (i, p)}
| FUTURE i=interval LPAR p = mtl RPAR {Finally (i, p)}
| NEG LPAR p = mtl RPAR {Neg p}
| CONJ LPAR p1= mtl COMMA p2= mtl RPAR {Conj (p1, p2)}  
| DISJ LPAR p1= mtl COMMA p2= mtl RPAR {Disj (p1, p2)}