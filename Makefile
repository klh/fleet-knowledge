.PHONY: help install typecheck test lint fmt run-sink run-worker run-mcp oracle clean

help:
	@echo "knowledge — generic knowledge plane for agent fleets"
	@echo "  make install      bun install"
	@echo "  make typecheck    tsc --noEmit over src/ bin/"
	@echo "  make test         bun test ./test/"
	@echo "  make lint         biome check src bin test"
	@echo "  make fmt          biome check --write src bin test"
	@echo "  make run-sink     the hub sink API on :7802"
	@echo "  make run-worker   the ingest worker daemon"
	@echo "  make run-mcp      the read-only recall MCP server (stdio)"
	@echo "  make oracle       oracle review/bugs/analyze/panel (args pass through)"
	@echo "  make clean        remove build artifacts"

install:
	bun install

typecheck:
	bun run typecheck

test:
	bun test ./test/

lint:
	bunx @biomejs/biome check src bin test

fmt:
	bunx @biomejs/biome check --write src bin test

run-sink:
	KNOWLEDGE_API_PORT=7802 bun run bin/knowledge-api.ts

run-worker:
	bun run bin/knowledge-worker.ts

run-mcp:
	bun run bin/knowledge-mcp.ts

oracle:
	bun run bin/oracle.ts $(ARGS)

clean:
	rm -rf node_modules .cache
