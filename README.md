# gscore-docker
docker image builder for [Genshin-bots/gsuid_core](https://docs.sayu-bot.com/)

```bash
docker pull ghcr.io/ohmykreee/gscore-docker:main
```

example docker-compose.yaml file, please REMEMBER to replace `!!ReplaceMe!!` to your own vaule:
```yaml
---
# https://github.com/ohmykreee/gscore-docker
services:
  gscore:
    image: ghcr.io/ohmykreee/gscore-docker:main
    container_name: gscore
    environment:
      - PUID=!!ReplaceMe!!
      - PGID=!!ReplaceMe!!
      - TZ=Asia/Shanghai
    network_mode: bridge
    ports:
      - !!ReplaceMe!!:8765
    volumes:
        - !!ReplaceMe!!/gscore/plugins/:/app/gsuid_core/plugins/
        - !!ReplaceMe!!/gscore/data/:/app/gsuid_core/data/
    restart: unless-stopped
```

~~哪个开源项目用python写而且没有官方docker啊，是谁呢~~
