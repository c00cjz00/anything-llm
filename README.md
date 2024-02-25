# anything-llm
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
http://$IP:3001

