## INSTALL Package sqlite3
```
sudo apt install sqlite3
```

## INSTALL anything-llm
1. download anything-llm script
```
cd $HOME
git clone https://github.com/c00cjz00/anything-llm.git
```
2. copy ssl folder to anything-llm (ssl/privatekey.key  ssl/root.cer        ssl/server.cer      ssl/uca.cer)
```
cp -rf $YOUR_SSL_FOLDR/ssl $HOME/anything-llm
```
3. stop anything-llm
```
cd $HOME/anything-llm
./stop.sh
```
4. stop anything-llm
```
cd $HOME/anything-llm
./start.sh
```
5. open url
https://$IP:3001

## SETUP anything-llm
1. LLM Preference, Local AI
```
Local AI Base URL: http://notebook.biobank.org.tw/api/v1
Token context window: 4096
Local AI API Key: ?
```
2. Embedding Preference
```
AnythingLLM Embedder
```
3. Vector Database Connection
```
LanceDB
```
4. Custom Logo
```
Upload your logo
```
5. User Setup
```
Just me, and set password
```
6. Create your first workspace
```
DEMO
```
7. Edit anything-llm/.env
```
LOCAL_AI_MODEL_PREF='TAIDE/b.11.0.0'
```
8. Restart
```
docker restart anythingllm
```
## LOGIN WEBSITE
Create New Workspace
```
TAIDE/b.11.0.0
TAIDE/t.0.1.0
TAIDE/k.0.1.0
```

## COMMAND MODE TO UPDATE DB anythingllm.db 
1. Stop anythingllm, and connect to sqlite3 DB 
```
docker stop anythingllm
sqlite3 $HOME/anything-llm/storage/anythingllm.db 
```

2. SQL CMD, than CTRL+Z to exit
``` 
sqlite> UPDATE workspaces SET chatModel = 'TAIDE/b.11.0.0' WHERE name = 'TAIDE/b.11.0.0';
sqlite> UPDATE workspaces SET chatModel = 'TAIDE/t.0.1.0' WHERE name = 'TAIDE/t.0.1.0';
sqlite>  UPDATE workspaces SET chatModel = 'TAIDE/k.0.1.0' WHERE name = 'TAIDE/k.0.1.0';
```

3. Start anythingllm
```
docker start anythingllm
```
"
