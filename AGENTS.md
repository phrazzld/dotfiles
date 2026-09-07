# workbench

Public source for workstation configuration, not a store for private machine
state. Keep secrets and private operational details out of this repository;
machine-local overrides remain untracked.

Editing source does not authorize installation, live configuration changes,
privilege grants, timer activation, or host administration. Follow the current
task's authority and the preview/apply boundaries in `README.md`. Host manifests
own installed paths; deployments use immutable releases and preserve backups,
not live links into this mutable checkout.

The private Daybook board is optional, task-relevant coordination context.
Consult it only when authorized work needs private operational knowledge or a
handoff; public source work must not depend on access to it. Do not copy board
contents here. Refer to secret stores by name, never by value.

`README.md` owns operating procedures and the repository check command.
