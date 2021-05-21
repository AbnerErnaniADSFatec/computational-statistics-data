// => Lista de Exercícios Model Checking
//
// Discrete-Time Marcov Chain - DTMC.
// Cadeia de Marcov em Tempo Discreto.
//
// Este arquivo .pm possui o código  que implementa
// o DTMC apresentado no exercício 01 da Lista.
dtmc

// Foi utilizado apenas um módulo para a
// implementação deste DTMC.
module dtmc_ex01

	// Definição de estados do modelo
	s : [0..6] init 0;

	// Definição das transições com as
	// proposições atomicas a e b definidas como ações.
	//
	// A proposição "n" diz respeito ao valor nulo ou
	// inexistência da proposição atômica.
	//
	// A linguagem PRISM
	// implementa as probabilidades em
	// [action] guard -> prob_n : update_n;
	[b] s=0 -> 1/3 : (s'=1) + 2/3 : (s'=5);
	[b] s=1 -> 2/3 : (s'=6) + 1/3 : (s'=1);
	[a] s=2 -> 4/5 : (s'=6) + 1/5 : (s'=1);
	[a] s=3 -> 8/9 : (s'=4) + 1/9 : (s'=3);
	[b] s=4 -> 1 : (s'=3);
	[n] s=5 -> 1/4 : (s'=6) + 1/4 : (s'=4) + 2/4 : (s'=0);
	[b] s=6 -> 1/2 : (s'=2) + 1/2 : (s'=6);

endmodule

// Aplicação de custos/recompenças
rewards "cost"

	// Foi aplicado um custo de uma unidade
	// para cada transição
	true: 1;

endrewards
