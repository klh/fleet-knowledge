// spawn-child bootstrap module: both store openers from one path — the
// spawn-based tests pass this as W1218_GOVDB/W1221_GOVDB to `bun -e` children
export { openGovernorDb } from "../src/db.ts";
export { openKnowledgeDb } from "../src/knowledge-db.ts";
