# Job Protocol

SpecNode jobs are typed protocol messages exchanged between a SpecGraph or
SpecPM control plane and a local node.

## Goals

The job protocol must:

- keep remote work bounded and auditable;
- avoid arbitrary prompt execution;
- make policy explicit per job;
- require output schema validation;
- leave room for signed receipts and Agent Passport identity.

## Pairing

Pairing starts in the web service and completes from the local node. The node
registers its runtime, providers, capabilities, and limits.

```json
{
  "node_name": "Egor MacBook Pro",
  "runtime": {
    "os": "macOS",
    "arch": "arm64",
    "specnode_version": "0.1.0"
  },
  "providers": [
    {
      "kind": "ollama",
      "base_url_kind": "localhost",
      "models": ["qwen3:4b", "llama3.2:3b"]
    }
  ],
  "capabilities": [
    "repo.scan",
    "repo.chunk",
    "llm.chat",
    "specgraph.extract",
    "specgraph.build",
    "specpm.package"
  ],
  "limits": {
    "max_concurrent_jobs": 1,
    "max_repo_size_mb": 500,
    "max_job_duration_ms": 900000
  }
}
```

## Job Envelope

A job describes the repository input, task type, policy, and output schema.
Policy must be checked before execution.

```json
{
  "job_id": "job_01H00000000000000000000000",
  "service": "specgraph",
  "type": "specgraph.extract_module_intent",
  "repo": {
    "source": "remote",
    "url": "https://github.com/org/project",
    "commit": "8f3a1c0d2e4f67890123456789abcdef01234567"
  },
  "policy": {
    "allow_network": false,
    "allow_shell": false,
    "allow_filesystem_outside_workspace": false,
    "allow_llm_tools": false,
    "max_input_tokens": 12000,
    "max_output_tokens": 1200,
    "timeout_ms": 60000
  }
}
```

## Rejection Cases

The node may reject a job before execution if:

- the job type is not allowlisted;
- the policy exceeds local limits;
- the requested provider or model is unavailable;
- the repository size exceeds local policy;
- the output schema is missing or invalid.

## Initial Job Types

SpecGraph jobs:

- `specgraph.extract_file_summary`
- `specgraph.extract_module_intent`
- `specgraph.extract_capabilities`
- `specgraph.build_graph_fragment`

SpecPM jobs:

- `specpm.inspect_repo`
- `specpm.extract_package_metadata`
- `specpm.build_package_manifest`
- `specpm.generate_conformance_hints`

## Source

The canonical contract is `specs/JOB_PROTOCOL.md`.

## Next Topics

- <doc:SecurityModel>
- <doc:ProvenanceReceipts>
