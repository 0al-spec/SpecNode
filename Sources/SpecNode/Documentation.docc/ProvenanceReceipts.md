# Provenance and Usage Receipts

SpecNode artifacts should be auditable even when the first MVP does not yet
implement cryptographic signing.

Digest fields use the canonical string form
`sha256:<64 lowercase hex characters>`.

## Artifact Set

A complete local run should be able to produce:

- `specgraph.json`
- `spec-package.yaml`
- `provenance.json`
- `usage_receipt.json`
- optional conformance tests or hints
- optional signature bundle

## Provenance Fields

Provenance records the tool, source repository, provider, job policy, prompt
set, artifacts, and generation time.

```json
{
  "generated_by": {
    "tool": "specnode",
    "version": "0.1.0"
  },
  "source": {
    "repo": "https://github.com/org/project",
    "commit": "8f3a1c0d2e4f67890123456789abcdef01234567",
    "tree_hash": "sha256:1111111111111111111111111111111111111111111111111111111111111111"
  },
  "provider": {
    "kind": "ollama",
    "model": "qwen3:4b"
  },
  "job": {
    "type": "specpm.build_package_manifest",
    "policy_hash": "sha256:2222222222222222222222222222222222222222222222222222222222222222",
    "prompt_set_hash": "sha256:3333333333333333333333333333333333333333333333333333333333333333"
  }
}
```

## Signing Stages

Stage 0:

- unsigned receipts;
- schema validation;
- artifact hashes.

Stage 1:

- local node keypair;
- signed artifact bundle;
- public key registered during pairing.

Stage 2:

- Agent Passport identity;
- issuer chain;
- expiration and revocation metadata;
- registry-side signature verification.

## Source

The canonical contract is `specs/PROVENANCE_RECEIPTS.md`.

## Next Topics

- <doc:JobProtocol>
- <doc:SecurityModel>
