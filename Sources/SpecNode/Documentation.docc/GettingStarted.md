# Getting Started

SpecNode does not have an installable runtime yet. The repository currently
defines the protocol, security posture, provenance model, and MVP execution
shape for a future local node.

## Build Documentation

Build the DocC documentation locally:

```bash
make docs-build
```

The documentation build writes static output to `.docc-build/`.

## Target Runtime Shape

The expected CLI shape remains a design target:

```bash
specnode connect --code 8K4P-X2Q9
specnode providers list
specnode test --model qwen3:4b
specnode specpm build --repo . --model qwen3:4b
specnode specpm validate ./dist/spec-package.yaml
```

The first executable slice should prove one local SpecGraph extraction job and
one SpecPM package-build job through a local provider.

## Useful Paths

- Product and architecture proposals: `docs/proposals/`
- Protocol and security contracts: `specs/`
- Runtime implementation, once selected: `src/`
- Conformance and regression tests, once runtime exists: `tests/`
- Developer or validation tooling: `tools/`

## Quality Gates

Use repository validation before opening or merging changes:

```bash
git diff --check
make docs-build
```

Runtime changes should add focused tests for the behavior being introduced.
Security-sensitive changes should name the trust boundary and at least one
negative case or abuse scenario.

## Next Topics

- <doc:JobProtocol>
- <doc:SecurityModel>
- <doc:ProvenanceReceipts>
