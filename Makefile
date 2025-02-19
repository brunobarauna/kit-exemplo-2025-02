# Formato geral de um makefile

#alvo: pre-req1, pre-req2, ...
#	comando para gerar o alvo

all: resultados/variacao_temperatura.csv resultados/numero_de_dados.txt
	#Nenhum comando, o "all" é um alvo fictício
	
clean:
	rm -r -f -v resultados dados

resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt

dados/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados
	
resultados/variacao_temperatura.csv: code/variacao_temperatura_todos.sh dados/temperature-data.zip
	mkdir -p resultados
	bash code/variacao_temperatura_todos.sh > resultados/variacao_temperatura.csv