# Security Model

SpecNode runs on a user's machine and receives work from a remote control
plane. The default posture is deny-by-default with explicit capabilities per
job.

## Trust Boundaries

```text
SpecGraph/SpecPM cloud
        |
        | typed jobs over outbound WSS
        v
specnode process
        |
        | bounded local workspace
        v
repository content and generated artifacts

specnode process
        |
        | localhost only
        v
local LLM provider
```

The cloud does not receive direct access to the local provider endpoint. The
provider base URL is local configuration, not remote authority.

## Threats

SpecNode must account for:

- malicious repository content;
- prompt injection inside source files, README files, issues, or docs;
- malicious or compromised control-plane jobs;
- accidental overuse of local CPU or GPU resources;
- artifact forgery or stale provenance;
- leakage of local secrets from outside the workspace.

## MVP Controls

The first runtime slice should enforce:

- outbound-only connection;
- typed jobs only;
- allowlisted job types;
- workspace-only file access;
- no shell by default;
- no LLM tools in the MVP;
- no filesystem access for LLM output;
- no network access unless job policy grants a narrow allowlist;
- maximum repository size;
- maximum job duration;
- maximum token budget;
- schema validation before artifact upload;
- local activity log visible to the user;
- node revoke or disconnect operation.

## Repository Content Handling

Repository content is data, not instruction.

The node must not obey instructions found in repository files that ask it to:

- ignore system policy;
- reveal local secrets;
- access files outside the workspace;
- run shell commands;
- call network services;
- alter provenance;
- disable validation.

## Source

The canonical contract is `specs/SECURITY_MODEL.md`.

## Next Topics

- <doc:JobProtocol>
- <doc:ProvenanceReceipts>
