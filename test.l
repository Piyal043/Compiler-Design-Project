small [a-z]
capital [A-Z]
digit [0-9]
space [" "]
intt "v_int"
stringg "v_string"
doublee "v_double"
voidd "v_void"

character ({small}+|{capital}+|{digit}+)
varialbe ({voidd}|{intt}|{stringg}|{doublee})
operator [+|*|/|=|;|:|-]



iff "@if"
elsee "@else"
elif "@elif"
while "@while"
bt "bt"
st "st"
take "take"
put "put"
thenn "then"

lfb "lfb"
rfb "rfb"
lsb "lsb"
rsb "rsb"
ltb "ltb"
rtb "rtb"

as "as"
for "@for"
too "to"

include "+include"
main "main"

lp "_lp"
rp "_rp"
rtrn "rtrn"
stdio "io.h"
conio "conio.h"

break "brk"
continue "cnt"

bet "bet"
set "set"
eq "eq"
neq "neq"

add "add"
sub "sub"
mul "mul"
div "div"

adde "adde"
sube "sube"
mule "mule"
dive "dive"

pp "pp"
mm "mm"

and "and"
or "or"
not "not"

%{
	int key_count = 0;
	int var_count = 0;
	int text_count = 0;
%}

%%
{space}* {}

"//"(.)* { printf("This is comment\n");}

{varialbe}{space}vv_{character}+{space}":"{space}{lfb}{space}{varialbe}{space}vv_{character}+{space}{rfb} {
																	printf("User Defined Function\n");
                                                                  }

{varialbe}{space}vv_{character}+"["{digit}+"]" {printf("Array!\n");}

({break}|{continue}|{rtrn}|{elif}|{iff}|{elsee}|{put}) {
														 printf("Keyword\n");
														 key_count++;
														}

{include}{space}{st}{space}({conio}|{stdio}){space}{bt} {printf("Header Declaration!\n");}

({intt}|{voidd}){space}{main}{space}":"{space}{lfb}{space}{rfb} {printf("This is main Function\n");}


{for}{space}{lfb}{space}vv_{character}+":"vv_{character}+"+"{digit}+":"[+|-]{space}{rfb} {
													 printf("For Loop\n");
													}

{while}{space}{lfb}{space}vv_{character}+{space}({neq}|{bet}|{set}|{eq}|{bt}|{st}){space}{digit}*{space}{rfb} {
													 printf("While Loop\n");
													}


vv_{character}+ { printf("This is a variable\n"); var_count++; }

({and}|{or}|{not}) {printf("Logical Operator\n");}

({neq}|{bet}|{set}|{eq}|{bt}|{st}) {printf("Relational Operator\n");}

({pp}|{mm}) {printf("Increment/Decrement Operator\n");}

({adde}|{mule}|{sube}|{dive}|{as}) {printf("Assignment Operator\n");}

({add}|{div}|{mul}|{sub}) {printf("Arithmetic Operator\n");}

(variable) {printf("Data Type");}

{lsb} {printf("Block Start\n");}

{rsb} {printf("Block End\n");}

{take}{space}{lfb}{space}vv_{character}+{space}{rfb}";" {
				  printf("Read Function\n");
                }

":" {printf("Colon(punctuation)\n");}
";" {printf("SemiColon(punctuation)\n");}

{put}{space}{lfb}{space}(\"({character}+|{space}+)+\"){space}{rfb}";" {
										printf("This is text for print\n");
										text_count++;
									}


{digit}* {printf("It's a Number\n");}





%%

int yywrap(){
	return 1;
}

main(){
	freopen("project.txt","r",stdin);
	//freopen("output.txt","w",stdout);
	printf("Starting..!!\n");
	yylex();
	printf("Total no of keyword = %d and variable = %d and text = %d",key_count,var_count, text_count);
}
