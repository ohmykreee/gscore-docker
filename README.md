# gscore-docker
docker image builder for Genshin-bots/gsuid_core

```bash
docker pull ghcr.io/ohmykreee/gscore-docker:main
```

example docker-compose.yaml file:
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
    volumes:
        - !!ReplaceMe!!/gscore/plugins/:/app/gsuid_core/plugins/
        - !!ReplaceMe!!/gscore/data/:/app/gsuid_core/data/
    restart: unless-stopped
```
