// shared test helpers: scratch dirs + OS-picked loopback ports
import { mkdtempSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

export function tmpDir(prefix: string): string {
	return mkdtempSync(join(tmpdir(), prefix));
}

// Let the OS choose an unused loopback port; fixed test ports can silently
// attach to a sink left by another run.
export function unusedPort(): number {
	const server = Bun.serve({
		hostname: "127.0.0.1",
		port: 0,
		fetch: () => new Response(),
	});
	const port = server.port ?? 0;
	server.stop(true);
	return port;
}
