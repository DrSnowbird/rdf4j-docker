import requests

REPO_ID=rdf-shacl

url="http://0.0.0.0:28080/rdf4j-server/repositories/${REPO_ID}/rdf-graph/service"
CONTENT_TYPE=${2:-"application/rdf+xml"}
DATA_FILE=${3:-"/mnt/user1/DATA/git-public/prototype/STRATAGEM/d3fend.owl"}
GRAPH_NAME=${4:-"http://d3fend/ontology"}

url = 'http://localhost:7200/repositories/metaphactory1/statements'
headers = { 'Content-type': 'application/x-turtle', }
file_path = '/path/to/your/file/graph-29.ttl'
graph_name = 'http://graph-29'

params = {'graph': graph_name} #optional
response = requests.post(url, headers=headers, params=params, data=open(file_path,'r', encoding='utf-8').read())

print(f'>>> response:\n{reponse}')

