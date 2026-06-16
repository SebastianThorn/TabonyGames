# TabonyGames
Website for the game(s) implemented by Charles J. Tabony (Logitude)

# Build
```bash
docker build --progress plain -t tabony:local .
```

# Run
```bash
docker run --rm -it tabony:local
```

# oneliner
```bash
docker build --progress plain -t tabony:local . && docker run --rm -p 8000:8000 tabony:local
```
Point your browser to http://localhost:8000/
