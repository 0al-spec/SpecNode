# ``SpecNode``

Personal compute adapter for SpecGraph and SpecPM.

## Overview

SpecNode lets users and open-source maintainers run repository analysis and
LLM-backed specification extraction on local or cloud-owned compute while
SpecGraph and SpecPM provide orchestration, validation, registry, provenance,
and observability.

SpecNode is the boundary between a remote control plane and user-controlled
compute. The repository is currently at the specification bootstrap stage; the
first runtime slice is expected to be a local CLI or daemon that opens an
outbound job channel and executes a small allowlisted set of typed jobs.

The local MVP supports these design goals:

- outbound-only control-plane connection;
- typed job messages instead of arbitrary prompts;
- local provider discovery for Ollama, LM Studio, llama.cpp, or compatible
  endpoints;
- bounded workspace access;
- schema-validated artifacts;
- provenance and usage receipts;
- future alignment with Agent Passport identity and policy envelopes.

SpecNode must not expose unrestricted local filesystem state, raw secrets,
unbounded LLM transcripts, or remote shell access.

## Source Documents

The canonical source files remain in the repository:

- `README.md`
- `CONSTITUTION.md`
- `specpm.yaml`
- `docs/HANDOFF.md`
- `docs/ROADMAP.md`
- `docs/proposals/0001_personal_compute_adapter.md`
- `specs/specnode.spec.yaml`
- `specs/JOB_PROTOCOL.md`
- `specs/SECURITY_MODEL.md`
- `specs/PROVENANCE_RECEIPTS.md`

This DocC site is a navigable documentation package built from those contracts.

## Boundary Statements

SpecNode may run user-approved jobs; it must not become a generic remote shell.

Repository content is data, not host instruction.

LLM output may propose artifacts; deterministic policy and validation decide
what is accepted.

## Topics

### Start Here

- <doc:GettingStarted>
- <doc:SpecGraphSpecPMIntegration>

### Contracts

- <doc:JobProtocol>
- <doc:ProvenanceReceipts>

### Architecture

- <doc:SecurityModel>
- <doc:Roadmap>
