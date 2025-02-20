# Formato geral de um makefile

#alvo: pre-req1, pre-req2, ...
#	comando para gerar o alvo

all: resultados/numero_de_dados.txt paper/paper.pdf
	#Nenhum comando, o "all" é um alvo fictício
	
clean:
	rm -r -f -v resultados dados figuras paper/paper.pdf
	
paper/paper.pdf: paper/paper.tex figuras/variacao_temperatura.png
	tectonic -X compile paper.tex

resultados/numero_de_dados.txt: dados/temperature-data.zip
	mkdir -p resultados
	ls dados/temperatura/*.csv | wc -l > resultados/numero_de_dados.txt

dados/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py dados
	
resultados/variacao_temperatura.csv: code/variacao_temperatura_todos.sh dados/temperature-data.zip
	mkdir -p resultados
	bash code/variacao_temperatura_todos.sh > resultados/variacao_temperatura.csv
	
figuras/variacao_temperatura.png: code/plota_dados.py resultados/variacao_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py resultados/variacao_temperatura.csv figuras/variacao_temperatura.png
	