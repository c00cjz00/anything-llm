mkdir -p storage
export STORAGE_LOCATION=$HOME/anything-llm && \
docker run -d -p 3001:3001 \
--cap-add SYS_ADMIN \
-v ${STORAGE_LOCATION}/storage:/app/server/storage \
-v ${STORAGE_LOCATION}/ssl:/app/ssl \
-v ${STORAGE_LOCATION}/.env:/app/server/.env \
-e STORAGE_DIR="/app/server/storage" \
--name anythingllm \
mintplexlabs/anythingllm
