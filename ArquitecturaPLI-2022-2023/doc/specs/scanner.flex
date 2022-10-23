package compiler.lexical;

import compiler.syntax.sym;
import compiler.lexical.Token;
import es.uned.lsi.compiler.lexical.ScannerIF;
import es.uned.lsi.compiler.lexical.LexicalError;
import es.uned.lsi.compiler.lexical.LexicalErrorManager;

// incluir aqui, si es necesario otras importaciones


// DIRECTIVAS

%%
 
%public
%class Scanner
%char
%line
%column
%cup
%unicode


%implements ScannerIF
%scanerror LexicalError

// incluir aqui, si es necesario otras directivas

%{
  LexicalErrorManager lexicalErrorManager = new LexicalErrorManager ();
  private int commentCount = 0;
%}  
  

ESPACIO_BLANCO=[ \t\r\n\f]
fin = "fin"{ESPACIO_BLANCO}
CHARACTER=[a-zA-Z]
DIGIT=[0-9]
COMMENT=("--")

%%

<YYINITIAL> 
{

     // DELIMITADORES
     
     
     // OPERADORES ARITMETICOS
     
     "+"                {  
                           Token token = new Token (sym.PLUS);   // nuevo objeto token
                           token.setLine (yyline + 1);           // fija la linea
                           token.setColumn (yycolumn + 1);       // fija la columna
                           token.setLexema (yytext ());          // fija el lexema
           			       return token;                         // devuelve el token
                        }
    
     "-"                {  
                           Token token = new Token (sym.MINUS);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
     
     "*"                {  
                           Token token = new Token (sym.MULT);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
                       
     "/"                {  
                           Token token = new Token (sym.DIV);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
                        
     ">"                {  
                           Token token = new Token (sym.GREATERTHAN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
                       
     "<"                {  
                           Token token = new Token (sym.LESSTHAN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
                        
     "/="               {  
                           Token token = new Token (sym.NOTEQUAL);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
                     
     ":="               {  
                           Token token = new Token (sym.ASIGN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
                        }
                        
      // PALABRAS RESERVADAS	
      
     
     "and"              { 
                           Token token = new Token (sym.AND);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }
     
     "begin"            { 
                           Token token = new Token (sym.BEGIN);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }
                        
     "Boolean"          { 
                           Token token = new Token (sym.BOOLEAN);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }
                        
     "constant"         { 
                           Token token = new Token (sym.CONSTANT);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }
                        
     "else"             { 
                           Token token = new Token (sym.ELSE);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }
                        
     "end"              { 
                           Token token = new Token (sym.END);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        } 
                        
     "False"            { 
                           Token token = new Token (sym.FALSE);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
                        
     "function"         { 
                           Token token = new Token (sym.FUNCTION);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
            
     "if"               { 
                           Token token = new Token (sym.IF);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
                        
     "Integer"          { 
                           Token token = new Token (sym.INTEGER);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
                        
     "is"               { 
                           Token token = new Token (sym.IS);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
                        
     "loop"               { 
                           Token token = new Token (sym.LOOP);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
                        
     "out"               { 
                           Token token = new Token (sym.OUT);  
                           token.setLine (yyline + 1); 
                           token.setColumn (yycolumn + 1); 
                           token.setLexema (yytext ()); 
                           return token;                           
                        }  
                        
     "procedure" 	    {
			               Token token = new Token (sym.PROCEDURE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            }  
			           
     "Put_line" 	    {
			               Token token = new Token (sym.PUT_LINE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            } 
			     
     "record" 	        {
			               Token token = new Token (sym.RECORD);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            } 
			            
	 "return" 	        {
			               Token token = new Token (sym.RETURN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            }  
			 
	 "then" 	        {
			               Token token = new Token (sym.THEN);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            }  
			            
	 "True" 	        {
			               Token token = new Token (sym.TRUE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            }  
			          
	 "type" 	        {
			               Token token = new Token (sym.TYPE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            }  
			            
	 "While" 	        {
			               Token token = new Token (sym.WHILE);
                           token.setLine (yyline + 1);
                           token.setColumn (yycolumn + 1);
                           token.setLexema (yytext ());
           			       return token;
			            }  
			            
                        
    
    // incluir aqui el resto de las reglas patron - accion
 

   {ESPACIO_BLANCO}	{}

{fin} {}
    
    // error en caso de coincidir con ningún patrón
    // I - Este patron controla los errores lexicos. Aquellos simbolos que se encuentren en el fichero fuente
    // I - que no correspondan con ningun patron declarado seran tratados como errores y lanzara lexicalError
    // I - que generara las salidas de error lexical error
    
	[^]     
                        {                                               
                           LexicalError error = new LexicalError ();
                           error.setLine (yyline + 1);
                           error.setColumn (yycolumn + 1);
                           error.setLexema (yytext ());
                           lexicalErrorManager.lexicalError (error);
                        }
    
}


                         


