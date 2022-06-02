%option noyywrap
%option noinput
%option nounput

%{

#include <iostream>
#include <cstdlib>
#include <string>
using namespace std;
#include "parser.tab.hpp"


%}

%%
broj {
	return br_token;
 }
tekst {
	return tekst_token;
 }
"ako je" {
	return if_token;
 }
inace {
	return else_token;
 }
blok {
	return block_token;
 }
kraj_bloka {
	return endblock_token;
 }
stampaj {
	return stampaj_token;
 }
[a-zA-Z_][a-zA-Z0-9]* {
	yylval.s = new string(yytext);
	return id_token;
 }
[0-9]+(\.[0-9]*)? {
	yylval.d = atof(yytext);
	return num_token;
 }
\"[^"]*\" {
	yylval.s = new string(yytext);
	return string_token;
 }
"//" {
	return cbdeljenje_token;
 }
"==" {
	return dvojednako_token;
 }
"!=" {
	return razlicito_token;
 }
"<" {
	return manje_token;
 }
">" {
	return vece_token;
 }
"<=" {
	return manjejednako_token;
 }
">=" {
	return vecejednako_token;
 }
[+*":()%;^/.=-] {
	return *yytext;
 }
[ \n\t] {

 }
. {
	cerr << "Leksicka greska: Neprepoznat karakter '" << *yytext << "'" << endl;
	exit(EXIT_FAILURE);
 }
%%
