#calcula a variação de temperatura para todos os países

echo "variacao_C_por_ano,pais"

for arquivo in dados/temperatura/b*.csv
do
	python $(dirname $0)/variacao_temperatura.py $arquivo
done