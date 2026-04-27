# SpecGraph and SpecPM Integration

SpecNode is the personal compute adapter for SpecGraph and SpecPM. It supplies
local or cloud-owned compute without granting either service arbitrary access to
the user's machine.

## Control Plane Shape

```text
SpecGraph / SpecPM control plane
        |
        | outbound WSS session from node
        v
specnode on user's device
        |
        | localhost only
        v
Ollama / LM Studio / llama.cpp / custom OpenAI-compatible endpoint
```

The control plane sends typed jobs. The node validates policy, executes within
local limits, validates structured output, and returns artifacts plus a usage
receipt.

## SpecGraph Responsibilities

SpecGraph can use SpecNode to:

- scan repository fragments;
- extract file summaries;
- extract module intent;
- extract capabilities with evidence;
- build graph fragments for later validation and promotion.

SpecGraph remains responsible for graph governance and deciding how extracted
intent becomes canonical graph state.

## SpecPM Responsibilities

SpecPM can use SpecNode to:

- inspect repositories;
- extract candidate package metadata;
- build candidate `specpm.yaml` manifests;
- generate conformance hints.

SpecPM remains responsible for package validation, registry contracts, and
exact package metadata semantics.

## Non-Goals

SpecNode should not:

- accept arbitrary natural-language work orders as executable authority;
- let LLM output invoke shell commands;
- upload unbounded local filesystem state;
- bypass SpecGraph or SpecPM validation;
- make repository content trusted host instruction.

## Next Topics

- <doc:JobProtocol>
- <doc:SecurityModel>
